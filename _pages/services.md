---
permalink: /services/
title: "Consulting"
browser_title: "Consulting | Ingmar Sturm"
excerpt: "Survey design, data quality, quantitative analysis, and research systems."
author_profile: true
---

<div class="services-intro">
  <p>I work with research and insights teams when a study is about to launch, the data does not look trustworthy, an analysis has real consequences, or a research process has become too manual.</p>
  <p>My background combines survey research, measurement, statistics, and applied data science. I can review a narrow problem independently, own a defined workstream, or join an existing team for a period of time.</p>
</div>

<div class="service-grid">
  <section class="service-card">
    <p class="service-card__eyebrow">Before fieldwork</p>
    <h2>Survey design and preflight</h2>
    <p>I review questionnaires, experiments, sampling, validation, weighting, and analysis plans before launch. The goal is simple: catch consequential problems while they are still cheap to fix.</p>
    <p class="service-card__examples"><strong>Useful for:</strong> pre-launch reviews, complex experiments, questionnaire logic, weighting plans, and independent methodological checks.</p>
  </section>

  <section class="service-card">
    <p class="service-card__eyebrow">When the data looks wrong</p>
    <h2>Data quality and respondent integrity</h2>
    <p>I investigate suspicious response patterns using answers, behavior, metadata, and open-ended text. I can evaluate existing screening rules and test whether quality decisions materially change the substantive findings.</p>
    <p class="service-card__examples"><strong>Useful for:</strong> post-fieldwork audits, fraud investigations, quality-control redesign, and ongoing monitoring.</p>
  </section>

  <section class="service-card">
    <p class="service-card__eyebrow">When the analysis matters</p>
    <h2>Quantitative analysis and measurement</h2>
    <p>I take projects from messy data to defensible conclusions. This can include cleaning, weighting, experimental and quasi-experimental analysis, predictive modeling, uncertainty, and communication for technical or nontechnical audiences.</p>
    <p class="service-card__examples"><strong>Useful for:</strong> overflow analysis, independent methods review, measurement strategy, and reproducible reporting.</p>
  </section>

  <section class="service-card">
    <p class="service-card__eyebrow">When the process is the problem</p>
    <h2>Research systems and automation</h2>
    <p>I build readable, testable systems for work that has become fragile or repetitive. Projects can include survey-data pipelines, quality checks, reporting, internal decision tools, and artificial-intelligence workflows with explicit verification.</p>
    <p class="service-card__examples"><strong>Useful for:</strong> workflow audits, internal tools, pipeline rebuilds, and research quality-control systems.</p>
  </section>
</div>

## Ways to work together

Most projects do not need to begin with a large engagement.

- **Focused review.** A tightly scoped audit with prioritized findings and concrete next steps.
- **Defined project.** Ownership of a specific workstream from scoping through delivery.
- **Embedded support.** Short-term or fractional quantitative help inside an existing team.
- **Agency support.** White-label work behind the scenes or directly with your client.

If the problem is adjacent to these areas but not an exact match, that is fine. Send me the problem rather than trying to fit it into a service category.

## Selected work

I built a model and self-serve tool that reduced survey-duration estimation error by 30 percent compared with existing pricing estimates. [Read the case study](/ux-case-study/).

My broader work has included large international survey studies, experiments and causal analysis, respondent-quality systems, predictive models, and production research infrastructure.

## Get in touch

Tell me what you are trying to do, what is already in place, and where you are least confident. A short description is enough. I will tell you whether I think I can help and what a sensible first step would be.

<form id="consulting-contact-form" class="services-form" action="https://formsubmit.co/me@ingmarsturm.com" method="POST">
  <input type="hidden" name="_subject" value="New consulting inquiry from ingmarsturm.com">
  <input type="hidden" name="_next" value="https://ingmarsturm.com/contact-sent/">
  <input type="hidden" name="_template" value="table">
  <input type="hidden" name="_captcha" value="false">
  <input class="services-form__honeypot" type="text" name="_honey" tabindex="-1" autocomplete="off" aria-hidden="true">

  <label for="contact-email">Email
    <input id="contact-email" type="email" name="email" autocomplete="email" required>
  </label>

  <label for="contact-message">What are you working on?
    <textarea id="contact-message" name="message" rows="7" required></textarea>
  </label>

  <button type="submit" class="btn">Send message</button>
  <p class="services-form__note" role="status" aria-live="polite">Please do not include confidential or sensitive data.</p>
</form>

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

    fetch('https://formsubmit.co/ajax/me@ingmarsturm.com', {
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
