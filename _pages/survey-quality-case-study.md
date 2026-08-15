---
permalink: /survey-quality-case-study/
title: "Building respondent-quality controls for an online research panel"
excerpt: "Turning respondent-quality review into a repeatable production process."
author_profile: true
---

An online research panel needed a more systematic way to decide which respondents could be trusted before they entered client studies. Individual signals were noisy, manual review did not scale, and the cost of a bad decision was asymmetric: weak controls let bad data through, while overly aggressive controls could remove legitimate respondents.

I built the panel-quality and fraud-detection function from the ground up, with the goal of turning respondent quality from an occasional investigation into a recurring operational process.

**Role:** Data Scientist  
**Setting:** Large online research panel  
**Scope:** Detection, decision rules, automation, and monitoring

## The problem

Respondent quality is not one variable. Suspicious accounts can look normal on one dimension and unusual on another, and the same signal can mean different things in different contexts.

A useful system therefore had to do more than produce a score. It needed to combine evidence, distinguish different levels of concern, support repeatable decisions, and fit into the panel's normal operating workflow.

## The approach

I developed a production process that:

- combined multiple behavioral and account-level signals rather than relying on one heuristic
- identified patterns that were difficult to see one respondent at a time
- separated clearly trusted accounts from cases requiring restriction or removal
- automated recurring review so quality decisions were applied consistently
- monitored the effects of those decisions rather than treating enforcement as the end of the analysis

The exact detection signals, thresholds, and enforcement rules are proprietary and are intentionally omitted here.

## The result

The work moved respondent-quality review from ad hoc investigation to a repeatable production system used before respondents were invited into studies. That made quality control an upstream part of research operations rather than a cleanup step after bad data had already entered a dataset.

It also created a framework for evaluating a question that matters to research teams: not merely whether a respondent looks suspicious, but whether the quality decision is strong enough to justify changing who is allowed into a study.

## What carried forward

- No single fraud indicator was reliable enough to carry the decision by itself.
- The operational decision rule mattered as much as the predictive model.
- Quality controls are more useful when they act before fieldwork than when they only flag records after collection.
- Enforcement needs monitoring because false positives can damage a panel just as false negatives can damage a study.

If you are dealing with suspicious survey data or uncertain respondent-quality rules, see the [Survey Data Integrity Audit](/services/#survey-data-integrity-audit).
