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
gallery/
  <edit_id>/
    before.glb    # source 3D asset
    after.glb     # edited 3D asset
    poster.png    # preview thumbnail (shown before "Load 3D")
```

`assets/` holds **placeholder** figures — replace with real ones.
`gallery/` holds 7 real editing examples from the Pxform Dataset (one per
edit type), copied from `outputs/H3D_gallery`.

## Editing Results section

The gallery is a **one-column list of edit cards**. Each card has:

- a colour-coded **edit-type chip** (addition / deletion / modification /
  scale / color / material / global)
- the editing **prompt**
- a before/after slider — left of the slider is `before.glb` (Before),
  right is `after.glb` (After)

To add a new example: copy a `gallery/<edit_id>/` folder (with `before.glb`,
`after.glb`, `poster.png`) and copy one `<div class="results-gallery-item">`
block in `index.html`, updating the chip `data-type`, prompt and the three
file paths.

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
