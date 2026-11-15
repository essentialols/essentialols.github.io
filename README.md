# ingmarsturm.com

Source for **[ingmarsturm.com](https://ingmarsturm.com)**, the personal site of Ingmar Sturm: survey methodology, data quality, quantitative research and research-automation work, with consulting services, selected case studies and a CV.

It is a [Jekyll](https://jekyllrb.com) site served by GitHub Pages. Every page renders through one custom layout, `v3`, with its own stylesheet and no third-party theme CSS or JavaScript. The site started from the [academicpages](https://github.com/academicpages/academicpages.github.io) template, itself based on [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/); the content and configuration are specific to this site, so it is not meant to be reused as a template.

## Structure

| Path | Purpose |
| --- | --- |
| `_pages/` | Page content: homepage (`about.md`, permalink `/`), consulting, work, academia, case studies and utility pages |
| `_data/navigation.yml`, `_data/ui-text.yml` | Main navigation (the `v3` list) and the label strings the SEO include uses |
| `_config.yml` | Site configuration: metadata, author information, plugins, include/exclude rules |
| `_layouts/`, `_includes/` | `v3.html` (every page) and `compress.html`; the `v3/` partials, `seo.html` and `base_path` |
| `assets/css/v3.scss` | The site stylesheet, self-contained; compiles to `assets/css/v3.css` |
| `images/`, `files/` | Published images and downloadable files |
| `CNAME` | Custom domain for GitHub Pages |
| `robots.txt`, `favicon.ico`, `LICENSE` | Crawler policy and sitemap pointer, favicon, MIT licence for the inherited template code |
| `Gemfile`, `Gemfile.lock` | Ruby dependencies (the `github-pages` gem, to stay close to the Pages build environment) |

`_site/` and `vendor/` are ignored by Git (Jekyll build output and bundled gems). `courses/` and `cv-source/` may exist in a local working copy; they hold material that is not part of the public site, are ignored by Git, and are excluded from the Jekyll build in `_config.yml`.

## Run locally

You need Ruby and Bundler.

```bash
bundle install
bundle exec jekyll serve    # http://localhost:4000
bundle exec jekyll build    # build only
```

Jekyll does not reload `_config.yml` while serving, so restart the server after changing it. Keep `Gemfile.lock`: it records the dependency set the site is built with.

## Editing notes

- Most content changes belong in `_pages/`. Keep the front matter (`permalink`, `title`, `browser_title`, `description`, `excerpt`) in step with the visible copy.
- When changing page positioning or titles, update the page metadata, the structured data in `_config.yml` and the on-page text together.
- The underscore-prefixed directories (`_pages`, `_data`, `_includes`, `_layouts`) have fixed roles in Jekyll; do not rename them.
- `main` is the production branch: GitHub Pages publishes it at the domain in `CNAME`.

## License and attribution

The inherited template code is derived from academicpages and Minimal Mistakes (Copyright (c) 2016 Michael Rose) and is available under the MIT License; see [LICENSE](LICENSE). The site's own text, images and CV are not covered by that license.
