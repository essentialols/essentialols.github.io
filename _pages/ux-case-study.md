---
permalink: /ux-case-study/
title: "Predicting Survey Duration More Reliably"
excerpt: "How survey-design data replaced inconsistent pricing estimates."
author_profile: false
---


<div class="case-study">

<div class="case-meta">
<span>Company: Survey technology company</span><br>
<span>Role: Senior Data Scientist</span>
<span>Timeline: February - April 2026</span>
<span>Team: Solo (with cross-functional collaborators)</span>
</div>

## The Problem

Sales teams at a survey panel company priced client contracts using a duration estimate: how long will this survey take respondents to complete? The estimate determined per-respondent cost, project timeline, and respondent compensation.

There was no systematic approach. Each salesperson estimated by intuition, and estimates varied wildly for the same survey. Nobody had quantified the error or built infrastructure to fix it.

The consequences were real in both directions:

- **Overestimation** meant overpriced contracts, potentially losing competitive bids
- **Underestimation** meant margin erosion, respondent burden, and drop-off risk

<div class="highlight-box">
<strong>Research question:</strong> How do pricing teams estimate survey duration today? Where does judgment systematically fail? And what evidence would they trust enough to change their process?
</div>

## Discovery

I started by analyzing 347 historical survey records, comparing the durations that were written into contracts against actual respondent completion times.

The patterns were striking:

- **Short surveys were consistently overestimated** (by up to 145% in extreme cases). Salespeople defaulted to conservative round numbers.
- **Long, complex surveys were underestimated** (by up to 48%). Branching logic and conditional questions made intuitive estimation nearly impossible.
- **Estimation variance** was as much of a problem as bias. Two salespeople could quote very different durations for the same survey, creating inconsistent client experiences.

A colleague on the operations team had independently been researching response time patterns, looking at differences between mobile and desktop respondents. After he presented his findings, I proposed combining his question-level timing data with a predictive modeling approach. He began adding timer questions to live surveys, generating calibration data.

Meanwhile, the Client Research team lead enabled my access to the survey design system's API, opening up the ability to extract structural features from every survey we had ever fielded.

## Research Approach

I extracted 40 design features from each of the 347 surveys, capturing everything a respondent would encounter:

**Survey structure:** Total questions, expected questions (accounting for branching), pages, branch complexity, randomization

**Question characteristics:** Multiple choice by option count, matrix grids by scale length, open text fields, sliders, ranking questions

**Reading load:** Word count, instruction text, embedded images, answer option length

**Text complexity:** Flesch readability score, long-word percentage, numeric density

**Path uncertainty:** The variance in question count across possible paths through the survey, maximum completer path length

The most technically novel piece was "flow-aware" survey parsing: walking the survey's branching logic to estimate how many questions a typical completer would actually see, rather than counting every question in the file. This turned out to be the single most important predictor (the top 3 features by importance were all path-related).

I compared 8 model variants (linear regression, regularized regression, Random Forest, gradient boosting). Random Forest on the full feature set outperformed all alternatives in cross-validation.

The model went through **8 versions during development**, and I preserved the approaches that didn't work:

- **LLM-based cognitive difficulty scoring** (tested two models to rate question complexity): no improvement. Survey-level aggregation washed out per-question variation.
- **Condition-based branch probability estimation** (parsing survey logic to estimate the probability each branch is taken): actively hurt accuracy. Flat heuristics worked better because the model learned corrections from other features.
- **The critical data fix**: I discovered that the model was training on median completion times that included screened-out respondents, not just completers. Building a definition-based completer filter via the survey flow tree jumped accuracy from R-squared 0.61 to 0.81.

## Key Findings

<div class="case-grid">
<div class="case-card">
<div class="label">Accuracy</div>
<div class="value">30%</div>
<div class="detail">reduction in estimation error vs. human contracted estimates</div>
</div>
<div class="case-card">
<div class="label">Head-to-head</div>
<div class="value">18 of 31</div>
<div class="detail">benchmark surveys where the model produced a closer estimate</div>
</div>
<div class="case-card">
<div class="label">Model fit</div>
<div class="value">R&sup2; = 0.81</div>
<div class="detail">out-of-bag, on 347 training surveys with 40 features</div>
</div>
</div>

Three cases illustrate the decision impact:

<table class="comparison-table">
<thead>
<tr><th>Survey</th><th>Actual Duration</th><th>Human Estimate</th><th>Model Estimate</th></tr>
</thead>
<tbody>
<tr>
<td><strong>Case A</strong> (short survey)</td>
<td>9.3 min</td>
<td class="loser">20.0 min (+114%)</td>
<td class="winner">10.4 min (+11%)</td>
</tr>
<tr>
<td><strong>Case B</strong> (long survey)</td>
<td>28.6 min</td>
<td class="loser">15.0 min (-48%)</td>
<td class="winner">21.1 min (-26%)</td>
</tr>
<tr>
<td><strong>Case C</strong> (branching survey)</td>
<td>6.1 min</td>
<td class="loser">15.0 min (+145%)</td>
<td class="winner">7.4 min (+20%)</td>
</tr>
</tbody>
</table>

In Case A, a 20-minute estimate for a 9-minute survey meant unnecessary cost baked into the contract. In Case B, a 15-minute estimate for a nearly 30-minute survey meant respondent burden and margin exposure. The model caught both directions because it could parse the survey's branching logic, something human estimators couldn't do consistently.

## The Product

I shipped a self-serve web application where non-technical users upload a survey design file and receive a duration prediction in seconds.

<div class="app-tabs">
<div class="app-tab-buttons" role="tablist" aria-label="Product screenshots">
<button type="button" class="app-tab-btn active" onclick="showTab('pred', this)" role="tab" aria-selected="true">Prediction</button>
<button type="button" class="app-tab-btn" onclick="showTab('summary', this)" role="tab" aria-selected="false">Survey summary</button>
<button type="button" class="app-tab-btn" onclick="showTab('nerds', this)" role="tab" aria-selected="false">Model details</button>
</div>
<div class="app-tab-content" id="tab-pred">
<img src="/images/ux-case-study/prediction-tab.png" alt="Prediction tab showing 2.1 minute estimate with 90% prediction interval" class="app-screenshot">
</div>
<div class="app-tab-content" id="tab-summary" style="display:none">
<img src="/images/ux-case-study/survey-summary-tab.png" alt="Survey Summary tab showing question types, reading load, and text complexity" class="app-screenshot">
</div>
<div class="app-tab-content" id="tab-nerds" style="display:none">
<img src="/images/ux-case-study/stats-tab.png" alt="Model details tab showing model info and feature importance" class="app-screenshot">
</div>
</div>

<script>
function showTab(id, button) {
  document.querySelectorAll('.app-tab-content').forEach(function (panel) {
    panel.style.display = 'none';
  });
  document.querySelectorAll('.app-tab-btn').forEach(function (tab) {
    tab.classList.remove('active');
    tab.setAttribute('aria-selected', 'false');
  });
  document.getElementById('tab-' + id).style.display = 'block';
  button.classList.add('active');
  button.setAttribute('aria-selected', 'true');
}
</script>

The tool has three views:

- **Prediction**: The duration estimate with a 90% confidence interval, plus a compact metadata summary (question count, blocks, pages)
- **Survey Summary**: A structured breakdown of question types, reading load, text complexity (rated Simple/Moderate/Complex), and survey logic
- **Technical Details**: All 40 features with their values and importance scores, for users who want to understand what's driving the prediction

The interface supports drag-and-drop file upload, shows real-time feedback, and was designed for salespeople and project managers who would never open a statistical model directly.

## Adoption & Impact

The Client Research team adopted the tool for routine use. In their words: _"We have been using it whenever we can."_ Within two weeks of deployment, they reported a bug with a specific survey type, attaching the file and a screenshot. I fixed it the same week. They also requested that matrix question counts be displayed in the Survey Summary view, which I shipped the same day.

The tool logged 45 sessions across 30 active days in its first two months, with consistent weekly usage.

An operations colleague independently contributed calibration data by adding timer questions to live surveys, creating a feedback loop between the model's predictions and real-world measurement.

**What I can claim with confidence:**

- The model is more accurate than human estimates on held-out data
- The tool was adopted by the team responsible for survey design review
- User feedback directly shaped iteration (matrix display, bug fixes)

**What remains projected:**

- Revenue impact from better pricing accuracy (estimated but not directly measured)
- Broader adoption beyond the Client Research team

## What I Learned

<div class="insight-cards">
<div class="insight-card">
<div class="num">01</div>
<h4>Research artifacts don't drive adoption on their own</h4>
<p>The model was accurate, but embedding predictions directly into the pricing workflow (CRM, proposal templates) would have driven deeper adoption than a standalone tool.</p>
</div>
<div class="insight-card">
<div class="num">02</div>
<h4>Variance matters as much as bias</h4>
<p>The bigger problem wasn't that estimates were systematically too high or too low. It was that two people would give very different estimates for the same survey. Consistency enables trust.</p>
</div>
<div class="insight-card">
<div class="num">03</div>
<h4>Trust is harder than accuracy</h4>
<p>Making predictions trustworthy for non-technical users required confidence intervals, readable survey summaries, and transparent feature importance, not just a number.</p>
</div>
</div>

In a future iteration, I would add usability testing before launch, instrument adoption tracking with user authentication, and build a stakeholder feedback loop to capture how predictions influence actual pricing decisions.


</div>
