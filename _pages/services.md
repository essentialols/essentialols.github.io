---
permalink: /services/
title: "Consulting"
browser_title: "Survey Quality & Research Consulting | Ingmar Sturm"
description: "Consulting in survey preflight review, data integrity audits, fractional quantitative research leadership, and research automation."
excerpt: "Survey quality, quantitative research, and research automation."
layout: v3
v3_intro: "I take on independent projects in survey design, data quality, and experimentation, including evaluating synthetic survey respondents and the quality of human data used to train AI."
service_offerings:
  - name: "Survey preflight"
    description: "A focused review before fieldwork starts, covering questionnaire wording, logic, validation, randomization, sampling, mobile behavior, data structure, and analysis readiness."
  - name: "Survey data integrity audit"
    description: "A diagnostic for completed or in-field survey data, examining response patterns and metadata for suspicious respondents, low-quality data, and threats to validity."
  - name: "Fractional quantitative research lead"
    description: "Senior quantitative support without making a full-time hire, covering study design, weighting, statistical analysis, experimentation, measurement, and technical review."
  - name: "Research automation sprint"
    description: "A defined project to remove repetitive work from a research workflow without removing verification, producing a documented and reproducible pipeline."
---

<div class="v3-wrap">
<div class="v3-rule-gold"></div>
<p class="v3-lede">Most projects start with a survey that needs a careful review, data nobody fully trusts, a team that needs senior quantitative capacity, or a research process that has become too manual.</p>

<div class="v3-service-grid">
<section class="v3-service">
<span class="v3-label">Before fieldwork</span>
<h2 id="survey-preflight">Survey preflight</h2>
<p class="v3-service__def">A focused review before fieldwork starts.</p>
<p>I review questionnaire wording, logic, validation, randomization, sampling, mobile behavior, data structure, and analysis readiness. The goal is simple: catch consequential problems while they are still cheap to fix.</p>
<p class="v3-service__out">Typical output: a prioritized list of launch blockers, risks, and recommended fixes.</p>
</section>
<section class="v3-service">
<span class="v3-label">When the data looks wrong</span>
<h2 id="survey-data-integrity-audit">Survey data integrity audit</h2>
<p class="v3-service__def">A diagnostic for completed or in-field survey data.</p>
<p>I examine response patterns and metadata for suspicious respondents, low-quality data, implementation failures, and other threats to validity. I also test whether quality decisions materially change the substantive findings.</p>
<p class="v3-service__out">Typical output: a documented quality assessment, sensitivity analysis, and recommended controls.</p>
</section>
<section class="v3-service">
<span class="v3-label">When the team needs capacity</span>
<h2 id="fractional-quantitative-research-lead">Fractional quantitative research lead</h2>
<p class="v3-service__def">Senior quantitative support without making a full-time hire.</p>
<p>I step into study design, weighting, statistical analysis, experimentation, measurement, technical review, and client-facing interpretation. I can work directly with clients or behind the scenes for research agencies.</p>
<p class="v3-service__out">Useful for: overflow work, unusually difficult studies, or projects that need an independent senior quantitative reviewer.</p>
</section>
<section class="v3-service">
<span class="v3-label">When the process is the problem</span>
<h2 id="research-automation-sprint">Research automation sprint</h2>
<p class="v3-service__def">A defined project to remove repetitive work without removing verification.</p>
<p>I automate repetitive research work without automating away verification. Projects can include questionnaire checks, data cleaning, quality control, analysis verification, reporting pipelines, internal tools, and research-system integrations.</p>
<p class="v3-service__out">Typical output: a working, documented workflow that reduces manual steps and makes important checks reproducible.</p>
</section>
</div>

<div class="v3-ways">
<h2 class="v3-h2">Ways to work together</h2>
<p class="v3-ways__intro">Most projects do not need to begin with a large engagement.</p>
<div class="v3-ways__row"><h3>Focused review</h3><p>A tightly scoped audit with prioritized findings and concrete next steps.</p></div>
<div class="v3-ways__row"><h3>Defined project</h3><p>Ownership of a specific workstream from scoping through delivery.</p></div>
<div class="v3-ways__row"><h3>Embedded support</h3><p>Short-term or fractional quantitative help inside an existing team.</p></div>
<div class="v3-ways__row"><h3>Agency support</h3><p>White-label work behind the scenes or directly with your client.</p></div>
<p class="v3-ways__note">If the problem is adjacent to these areas but not an exact match, send me the problem rather than trying to fit it into a service category.</p>
</div>
</div>

<section class="v3-contact" id="contact" style="margin:120px 0 -96px">
<div class="v3-wrap v3-contact__grid">
<div>
<div class="v3-rule-gold"></div>
<h2>Get in touch</h2>
<p>Tell me what you are trying to do, what is already in place, and where you are least confident. A short description is enough. I will tell you whether I think I can help and what a sensible first step would be.</p>
</div>
<form id="consulting-contact-form" class="v3-form services-form" action="https://splitforms.com/api/submit" method="POST">
  <input type="hidden" name="access_key" value="0516713c946e4bc088cd67af302f9dae">
  <input class="services-form__honeypot" type="checkbox" name="botcheck" tabindex="-1" autocomplete="off" aria-hidden="true">

  <label for="contact-email">Email
    <input id="contact-email" type="email" name="email" autocomplete="email" required>
  </label>

  <label for="contact-message">What are you working on?
    <textarea id="contact-message" name="message" rows="7" required></textarea>
  </label>

  <button type="submit">Send message</button>
  <p class="services-form__note" role="status" aria-live="polite">Please do not include confidential or sensitive data.</p>
</form>
</div>
</section>

<script>
(function () {
  var form = document.getElementById('consulting-contact-form');
  if (!form || !window.fetch) return;

  var button = form.querySelector('button[type="submit"]');
  var status = form.querySelector('.services-form__note');
  var defaultStatus = status.textContent;

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    if (!form.reportValidity()) return;

    button.disabled = true;
    button.textContent = 'Sending…';
    status.textContent = '';

    var payload = {};
    new FormData(form).forEach(function (value, key) {
      payload[key] = value;
    });

    fetch('https://splitforms.com/api/submit', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify(payload)
    })
      .then(function (response) {
        return response.json().then(function (data) {
          if (!response.ok || data.success === false || data.success === 'false') {
            throw new Error('Submission failed');
          }
          return data;
        });
      })
      .then(function () {
        form.reset();
        button.textContent = 'Sent';
        status.textContent = "Thanks. Message sent. I'll get back to you by email.";
        window.setTimeout(function () {
          button.textContent = 'Send message';
          status.textContent = defaultStatus;
        }, 8000);
      })
      .catch(function () {
        button.textContent = 'Send message';
        status.textContent = 'Something went wrong. Please try again in a moment.';
      })
      .then(function () {
        button.disabled = false;
      });
  });
})();
</script>
