---
permalink: /survey-quality-case-study/
title: "Building respondent-quality controls for an online research panel"
browser_title: "Respondent Quality Controls Case Study | Ingmar Sturm"
description: "How I turned ad-hoc respondent-quality review into a repeatable production process for an online research panel."
excerpt: "Turning respondent-quality review into a repeatable production process."
layout: v3
v3_section: "Work"
v3_eyebrow: "Case study"
v3_back_url: /work/
v3_back_label: "Work"
v3_facts:
  - label: "Role"
    value: "Data Scientist"
  - label: "Setting"
    value: "Large online research panel"
  - label: "Scope"
    value: "Detection, decision rules, automation, and monitoring"
---

<div class="v3-wrap">
<div class="v3-narrow v3-prose v3-prose--case" markdown="1">

<div class="v3-case-lede" markdown="1">
An online research panel needed a more systematic way to decide which respondents could be trusted before they entered client studies. Individual signals were noisy, manual review did not scale, and the cost of a bad decision was asymmetric: weak controls let bad data through, while overly aggressive controls could remove legitimate respondents.

I built the panel-quality and fraud-detection function from the ground up, with the goal of turning respondent quality from an occasional investigation into a recurring operational process.
</div>

## The problem

Respondent quality is not one variable. Suspicious accounts can look normal on one dimension and unusual on another, and the same signal can mean different things in different contexts.

A useful system therefore had to do more than produce a score. It needed to combine evidence, distinguish different levels of concern, support repeatable decisions, and fit into the panel's normal operating workflow.

## The approach

I developed a production process that:

<ol class="v3-steps">
<li>combined multiple behavioral and account-level signals rather than relying on one heuristic</li>
<li>identified patterns that were difficult to see one respondent at a time</li>
<li>separated clearly trusted accounts from cases requiring restriction or removal</li>
<li>automated recurring review so quality decisions were applied consistently</li>
<li>monitored the effects of those decisions rather than treating enforcement as the end of the analysis</li>
</ol>

<p class="v3-note">The exact detection signals, thresholds, and enforcement rules are proprietary and are intentionally omitted here.</p>

## The result

The work moved respondent-quality review from ad hoc investigation to a repeatable production system used before respondents were invited into studies. That made quality control an upstream part of research operations rather than a cleanup step after bad data had already entered a dataset.

It also created a framework for evaluating a question that matters to research teams: not merely whether a respondent looks suspicious, but whether the quality decision is strong enough to justify changing who is allowed into a study.

<div class="v3-panel">
<h2>What carried forward</h2>
<p>No single fraud indicator was reliable enough to carry the decision by itself.</p>
<p>The operational decision rule mattered as much as the predictive model.</p>
<p>Quality controls are more useful when they act before fieldwork than when they only flag records after collection.</p>
<p>Enforcement needs monitoring because false positives can damage a panel just as false negatives can damage a study.</p>
</div>

If you are dealing with suspicious survey data or uncertain respondent-quality rules: [See the Survey Data Integrity Audit →](/services/#survey-data-integrity-audit)

<a class="v3-next" href="/ux-case-study/"><span class="v3-label">Next case study</span><span>Predicting survey duration more reliably</span></a>

</div>
</div>
