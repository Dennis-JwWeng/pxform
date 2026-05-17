# PartFlow — Project Page

Project page for **PartFlow: Feedforward 3D Editing Learns from Semantic-Part
Transformation**, trained on the **Pxform Dataset**.

The page is a single static `index.html` (modeled on the `pixal3d` project page)
and is meant to be served as a GitHub Pages site.

## Structure

```
index.html        # the whole page (HTML + CSS + JS inline)
assets/
  teaser.png      # hero background image      (TODO: replace)
  pipeline.png    # method / pipeline figure   (TODO: replace)
results/
  editNN_input.png   # input image / edit instruction thumbnail
  editNN_src.glb     # original (un-edited) 3D asset
  editNN_edited.glb  # PartFlow edited 3D asset
```

The current `assets/` and `results/` files are **placeholders** copied for
layout testing — replace them with real PartFlow data.

## Editing Results section

Each gallery item is a before/after slider:

- left of the slider  → `editNN_src.glb`    (Original)
- right of the slider → `editNN_edited.glb` (Edited)

To add a new example, drop `editNN_input.png`, `editNN_src.glb`,
`editNN_edited.glb` into `results/` and copy one `<div class="results-gallery-item">`
block in `index.html`.

## TODO before publishing

Search `index.html` for `TODO`:

- author names / links / affiliations / venue
- abstract and method text
- Paper / arXiv / Code links in the hero
- real `assets/` figures and `results/` glb files
- citation entry

## Local preview

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Deploy (GitHub Pages)

1. Create an empty GitHub repository (e.g. `show-pxform`).
2. `git remote add origin <repo-url>` and push.
3. In repo Settings → Pages, serve from the `master` branch root.

> **Note:** `.glb` files are large binaries. If total size grows past a few
> hundred MB, track them with [Git LFS](https://git-lfs.com/) or attach them as
> GitHub Release assets and point `data-src` at the release URLs.
