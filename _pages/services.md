---
permalink: /services/
title: "Consulting"
excerpt: "Survey design, respondent quality, quantitative analysis, and research systems."
author_profile: true
---

I help research and insights teams solve problems with survey design, respondent quality, quantitative analysis, and research systems. Projects usually start with a study that needs review, data nobody trusts, or a process taking too much manual work.

## Survey design and preflight

I review questionnaires, experiments, sampling, validation, weighting, and analysis plans before fieldwork.

## Respondent quality

I diagnose low-quality or fraudulent responses, evaluate screening rules, and test whether quality decisions change the conclusions.

## Analysis and measurement

I clean and weight data, analyze experiments and observational studies, build models, and explain the uncertainty.

## Research systems

I build reproducible pipelines, quality checks, reporting, and internal tools that reduce manual work.

I am available for focused reviews, defined projects, and short-term embedded work. I can also work behind the scenes for research agencies.

## Selected work

I built a model and self-serve tool that reduced survey-duration estimation error by 30 percent compared with existing pricing estimates. [Read the case study](/ux-case-study/).

## Contact

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
  <p class="services-form__note" role="status" aria-live="polite">A short description is enough. Please do not include confidential data.</p>
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
        status.textContent = 'Something went wrong. Please try again, or use the email link in the sidebar.';
      })
      .then(function () {
        button.disabled = false;
      });
  });
})();
</script>
