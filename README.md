# ingmarsturm.com

Source for **[ingmarsturm.com](https://ingmarsturm.com)**, the personal site of Ingmar Sturm: survey methodology, data quality, quantitative research and research-automation work, with consulting services, selected case studies and a CV.

It is a [Jekyll](https://jekyllrb.com) site served by GitHub Pages, built on a heavily customized [academicpages](https://github.com/academicpages/academicpages.github.io) / [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme. The content and configuration are specific to this site, so it is not meant to be reused as a template. If you want a starting point for your own site, use one of those two projects.

## Structure

| Path | Purpose |
| --- | --- |
| `_pages/` | Page content: homepage (`about.md`, permalink `/`), consulting, work, academia, case studies and utility pages |
| `_data/navigation.yml` | Main navigation |
| `_config.yml` | Site configuration: metadata, author information, plugins, include/exclude rules |
| `_layouts/`, `_includes/`, `_sass/` | Layouts, Liquid/HTML fragments and styling |
| `assets/`, `images/`, `files/` | Theme assets, published images and downloadable files |
| `CNAME` | Custom domain for GitHub Pages |
| `Gemfile`, `Gemfile.lock` | Ruby dependencies (the `github-pages` gem, to stay close to the Pages build environment) |

`courses/` and `cv-source/` may exist in a local working copy; they hold material that is not part of the public site, are ignored by Git, and are excluded from the Jekyll build in `_config.yml`.

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
- The underscore-prefixed directories (`_pages`, `_data`, `_includes`, `_layouts`, `_sass`) have fixed roles in Jekyll; do not rename them.
- `main` is the production branch: GitHub Pages publishes it at the domain in `CNAME`.

## License and attribution

The theme code is derived from academicpages and Minimal Mistakes (Copyright (c) 2016 Michael Rose) and is available under the MIT License; see [LICENSE](LICENSE). The site's own text, images and CV are not covered by that license.
