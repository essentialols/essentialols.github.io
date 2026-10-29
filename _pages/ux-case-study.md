---
permalink: /ux-case-study/
title: "Predicting survey duration more reliably"
browser_title: "Predicting Survey Duration Case Study | Ingmar Sturm"
description: "How modeling survey structure replaced sales-team guesswork in estimating survey duration, improving pricing accuracy and margin predictability."
excerpt: "How survey structure improved pricing estimates."
layout: v3
v3_section: "Work"
v3_eyebrow: "Case study"
v3_back_url: /work/
v3_back_label: "Work"
v3_facts:
  - label: "Role"
    value: "Senior Data Scientist"
  - label: "Timeline"
    value: "February to April 2026"
  - label: "Team"
    value: "Solo, with collaborators in operations and client research"
---

<div class="v3-wrap">
<div class="v3-narrow v3-prose v3-prose--case" markdown="1">

<div class="v3-case-lede" markdown="1">
A survey technology company needed to estimate how long each client survey would take before pricing it. The estimate affected the contract, project timeline, respondent compensation, and expected margin. Salespeople made the estimate by judgment, so the same survey could receive very different numbers.

I built a prediction model and a self-serve tool that reads the survey structure directly.
</div>

## The problem

Overestimation made projects more expensive than necessary and could weaken a bid. Underestimation created margin risk, respondent burden, and drop-off. The company had no consistent method for measuring either problem.

I compared contracted duration estimates with actual completion times for 347 historical surveys. Short surveys were often overestimated. Long or heavily branched surveys were more likely to be underestimated. The variation between estimates was as important as the average bias.

## The approach

I extracted 41 features from each survey through the survey platform's application programming interface. These included question types, reading load, page count, branch complexity, and the expected number of questions along a respondent's path.

The path features mattered most. Counting every question in the file was misleading because respondents only saw the questions on their branch of the survey.

I compared eight model variants. A random forest using the full feature set performed best on held-out data. The largest improvement, however, came from fixing the outcome definition. The original completion-time measure included respondents who had screened out early. Restricting it to genuine completers increased model fit from 0.61 to 0.81.

## Results

<div class="v3-stats">
<div><strong>30%</strong><span>lower estimation error than existing human estimates</span></div>
<div><strong>18 of 31</strong><span>benchmark surveys where the model was closer</span></div>
<div><strong>R² 0.81</strong><span>model fit</span></div>
<div><strong>41</strong><span>features extracted from survey structure</span></div>
</div>

The model improved both kinds of error. It brought a 20-minute estimate for a 9.3-minute survey down to 10.4 minutes. For a survey that took 28.6 minutes but had been estimated at 15, it predicted 21.1 minutes.

## The tool

I turned the model into a web application for sales and project teams. A user uploads a survey design file and receives a prediction in seconds.

The application provides:

- a duration estimate with a 90 percent prediction interval
- a summary of question types, reading load, and survey logic
- the underlying feature values and importance scores

<div class="v3-shots">
<figure><img src="/images/ux-case-study/prediction-tab.png" alt="Prediction view showing the estimated survey duration and prediction interval" loading="lazy"><figcaption>Prediction and interval</figcaption></figure>
<figure><img src="/images/ux-case-study/survey-summary-tab.png" alt="Survey summary showing question types, reading load, and text complexity" loading="lazy"><figcaption>Survey summary</figcaption></figure>
<figure><img src="/images/ux-case-study/stats-tab.png" alt="Model details showing feature values and importance" loading="lazy"><figcaption>Model details</figcaption></figure>
</div>

## Adoption

The client research team used the tool in its normal review process. It recorded 45 sessions across 30 active days in the first two months. User reports also led directly to a bug fix and a new matrix-question summary.

The result I can support is narrower than a revenue claim. The model was more accurate on held-out data, the relevant team used the tool, and feedback shaped later versions. The effect on revenue was not measured.

<div class="v3-panel">
<h2>What I learned</h2>
<p>Modeling the respondent's actual path mattered more than counting the full survey.</p>
<p>A correct definition of completion time mattered more than another round of model tuning.</p>
<p>Accuracy alone did not create trust. Users also needed a clear interval, a readable survey summary, and enough detail to understand the prediction.</p>
</div>

<a class="v3-next" href="/survey-quality-case-study/"><span class="v3-label">Next case study</span><span>Building respondent-quality controls for an online research panel</span></a>

</div>
</div>
