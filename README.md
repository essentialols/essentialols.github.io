# ingmarsturm.com

This repository is the source for **[ingmarsturm.com](https://ingmarsturm.com)**, a production GitHub Pages site for Ingmar Sturm's survey methodology, data quality, quantitative research, and research-automation work.

The site is built with Jekyll and a heavily customized academicpages / Minimal Mistakes theme. This repository is **not** maintained as a reusable website template; the current content and configuration are specific to the live site.

## Current site

The public navigation is intentionally small:

- **Work** — selected case studies and project evidence
- **Consulting** — survey preflight, data-integrity audits, fractional quantitative research leadership, and research automation
- **Academia** — academic research and publications

The homepage is `_pages/about.md` with permalink `/`. The custom domain is defined by `CNAME` as `ingmarsturm.com`.

## Repository map

| Path | Purpose |
| --- | --- |
| `_pages/` | Public page content, including homepage, services, work, academia, case studies, and utility pages |
| `_data/navigation.yml` | Main site navigation |
| `_config.yml` | Site-wide Jekyll configuration, metadata, author information, plugins, include/exclude rules, and defaults |
| `_layouts/` | Page layouts |
| `_includes/` | Reusable Liquid / HTML fragments |
| `_sass/` | Theme and site styling sources |
| `assets/` | Site assets used by the theme and pages |
| `images/` | Images published with the site |
| `files/` | Public downloadable files |
| `Gemfile` / `Gemfile.lock` | Ruby and GitHub Pages dependencies |
| `robots.txt` | Search-crawler policy and sitemap pointer |
| `CNAME` | GitHub Pages custom domain |

Two local working directories are intentionally **not public site content**:

- `courses/` — local teaching material
- `cv-source/` — local CV working files

They are ignored by Git and also excluded in `_config.yml` because Jekyll reads the working directory independently of `.gitignore`.

## Edit the site

Most content changes belong in `_pages/`. Keep page metadata in the YAML front matter accurate, especially:

- `permalink`
- `title`
- `browser_title`
- `description`
- `excerpt`

The main navigation is controlled separately in `_data/navigation.yml`.

Site-wide identity, structured-data fields, Open Graph defaults, author information, plugins, and build exclusions live in `_config.yml`. Jekyll does not automatically reload `_config.yml` while serving locally, so restart the local server after changing it.

## Run locally

Prerequisites are Ruby and Bundler. The repository uses the `github-pages` gem so local builds stay close to the GitHub Pages environment.

```bash
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000`.

For a build-only validation:

```bash
bundle exec jekyll build
```

Do not casually delete `Gemfile.lock`: it records the dependency set used by this site. If dependencies need updating, update them deliberately and validate the resulting build.

## Publishing

`main` is the production source branch. GitHub Pages serves the site at the custom domain declared in `CNAME`.

Before publishing a structural change, check:

1. Jekyll include/exclude rules in `_config.yml`.
2. Liquid includes and layout references.
3. Internal links and page permalinks.
4. Image, stylesheet, JavaScript, and downloadable-file paths.
5. The local Jekyll build.

Jekyll's underscore-prefixed directories such as `_pages`, `_data`, `_includes`, `_layouts`, and `_sass` have framework-specific roles. Do not rename or reorganize them as ordinary folders without updating the corresponding Jekyll configuration and references.

## Search and sharing metadata

The site currently uses:

- per-page browser titles and meta descriptions
- Person structured data from `_config.yml`
- service-offering structured data on the consulting page
- a site-wide Open Graph image fallback
- `jekyll-sitemap`
- `robots.txt` with a sitemap reference

When changing page positioning or titles, update the visible copy and metadata together so the browser title, description, structured data, and on-page message do not drift apart.

## Theme provenance

This site originated from the [academicpages](https://github.com/academicpages/academicpages.github.io) GitHub Pages template, itself based on the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) Jekyll theme. The repository has since been detached and customized for this site. See `LICENSE` for licensing information.

<details>
<summary>Historical template README (archival)</summary>

The text below is preserved from the repository's former generic academicpages README for provenance. It is **not the operating guide for this site**; use the instructions above for the current repository.

A Github Pages template for academic websites. This was forked (then detached) by [Stuart Geiger](https://github.com/staeiou) from the [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/), which is © 2016 Michael Rose and released under the MIT License. See LICENSE.md.

I think I've got things running smoothly and fixed some major bugs, but feel free to file issues or make pull requests if you want to improve the generic template / theme.

### Note: if you are using this repo and now get a notification about a security vulnerability, delete the Gemfile.lock file.

# Instructions

1. Register a GitHub account if you don't have one and confirm your e-mail (required!)
1. Fork [this repository](https://github.com/academicpages/academicpages.github.io) by clicking the "fork" button in the top right.
1. Go to the repository's settings (rightmost item in the tabs that start with "Code", should be below "Unwatch"). Rename the repository "[your GitHub username].github.io", which will also be your website's URL.
1. Set site-wide configuration and create content & metadata (see below -- also see [this set of diffs](http://archive.is/3TPas) showing what files were changed to set up [an example site](https://getorg-testacct.github.io) for a user with the username "getorg-testacct")
1. Upload any files (like PDFs, .zip files, etc.) to the files/ directory. They will appear at https://[your GitHub username].github.io/files/example.pdf.
1. Check status by going to the repository settings, in the "GitHub pages" section
1. (Optional) Use the Jupyter notebooks or python scripts in the `markdown_generator` folder to generate markdown files for publications and talks from a TSV file.

See more info at https://academicpages.github.io/

## To run locally (not on GitHub Pages, to serve on your own computer)

1. Clone the repository and made updates as detailed above
1. Make sure you have ruby-dev, bundler, and nodejs installed: `sudo apt install ruby-dev ruby-bundler nodejs`
1. Run `bundle clean` to clean up the directory (no need to run `--force`)
1. Run `bundle install` to install ruby dependencies. If you get errors, delete Gemfile.lock and try again.
1. Run `bundle exec jekyll liveserve` to generate the HTML and serve it from `localhost:4000` the local server will automatically rebuild and refresh the pages on change.

# Changelog -- bugfixes and enhancements

There is one logistical issue with a ready-to-fork template theme like academic pages that makes it a little tricky to get bug fixes and updates to the core theme. If you fork this repository, customize it, then pull again, you'll probably get merge conflicts. If you want to save your various .yml configuration files and markdown files, you can delete the repository and fork it again. Or you can manually patch.

To support this, all changes to the underlying code appear as a closed issue with the tag 'code change' -- get the list [here](https://github.com/academicpages/academicpages.github.io/issues?q=is%3Aclosed%20is%3Aissue%20label%3A%22code%20change%22%20). Each issue thread includes a comment linking to the single commit or a diff across multiple commits, so those with forked repositories can easily identify what they need to patch.

</details>
