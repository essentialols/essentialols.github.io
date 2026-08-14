---
permalink: /services/
title: "Consulting"
excerpt: "Survey design, respondent quality, quantitative analysis, and research systems."
author_profile: true
---

<div class="services-intro">
  <p>I help research and insights teams with survey design, respondent quality, quantitative analysis, and research systems.</p>
  <p>Most projects start with a concrete problem: a study that needs review, data nobody trusts, or a process taking too much manual work.</p>
</div>

<div class="service-list">
  <section class="service">
    <span class="service__index" aria-hidden="true">01</span>
    <div class="service__body">
      <h2>Survey design and preflight</h2>
      <p>Review questionnaires, experiments, sampling, validation, weighting, and analysis plans before fieldwork.</p>
    </div>
  </section>

  <section class="service">
    <span class="service__index" aria-hidden="true">02</span>
    <div class="service__body">
      <h2>Respondent quality</h2>
      <p>Diagnose low-quality or fraudulent responses, evaluate screening rules, and test whether quality decisions change the conclusions.</p>
    </div>
  </section>

  <section class="service">
    <span class="service__index" aria-hidden="true">03</span>
    <div class="service__body">
      <h2>Analysis and measurement</h2>
      <p>Clean and weight data, analyze experiments and observational studies, build models, and explain the uncertainty.</p>
    </div>
  </section>

  <section class="service">
    <span class="service__index" aria-hidden="true">04</span>
    <div class="service__body">
      <h2>Research systems</h2>
      <p>Build reproducible pipelines, quality checks, reporting, and workflows that use artificial intelligence with verification built in.</p>
    </div>
  </section>
</div>

<p class="services-engagement">Available for focused reviews, defined projects, and short-term embedded work. I can also work behind the scenes for research agencies.</p>

<p class="services-proof"><strong>15 years</strong> in survey research <span aria-hidden="true">·</span> <strong>45,000+</strong> participants across 30+ countries <span aria-hidden="true">·</span> production systems handling millions of responses <span aria-hidden="true">·</span> research published in <em>Proceedings of the National Academy of Sciences</em> and <em>International Affairs</em></p>

<section class="services-example" aria-labelledby="example-heading">
  <p class="services-example__label">Example</p>
  <h2 id="example-heading"><a href="/ux-case-study/">Predicting survey duration more reliably</a></h2>
  <p>A model and self-serve tool that reduced estimation error by 30% compared with existing pricing estimates. <a href="/ux-case-study/">Read the case study →</a></p>
</section>

<section class="services-contact" aria-labelledby="contact-heading">
  <h2 id="contact-heading">Tell me what you're working on</h2>

  <form id="consulting-contact-form" class="services-form" action="https://formsubmit.co/me@ingmarsturm.com" method="POST">
    <input type="hidden" name="_subject" value="New consulting inquiry from ingmarsturm.com">
    <input type="hidden" name="_next" value="https://ingmarsturm.com/contact-sent/">
    <input type="hidden" name="_template" value="table">
    <input type="hidden" name="_captcha" value="false">
    <input type="text" name="_honey" tabindex="-1" autocomplete="off" aria-hidden="true" style="display:none !important">

    <label for="contact-email">Email
      <input id="contact-email" type="email" name="email" autocomplete="email" required>
    </label>

    <label for="contact-message">What are you working on?
      <textarea id="contact-message" name="message" rows="7" required></textarea>
    </label>

    <button type="submit" class="btn">Send message</button>
    <p class="services-form__note" role="status" aria-live="polite">A short description is enough. Please don't include confidential data.</p>
  </form>
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
