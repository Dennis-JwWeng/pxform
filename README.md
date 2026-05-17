# PartFlow — Project Page

Project page for **PartFlow: Feedforward 3D Editing Learns from Semantic-Part
Transformation**, trained on the **Pxform Dataset**.

The page is a single static `index.html` (modeled on the `pixal3d` project page)
and is meant to be served as a GitHub Pages site.

## Structure

```
index.html        # the whole page (HTML + CSS + JS inline)
assets/
  gallary.png     # hero background image
  pipeline.png    # method / pipeline figure   (TODO: replace)
gallery/
  manifest.json   # [{edit_id, edit_type, prompt}, ...]
  <edit_id>/
    before.glb    # SLAT-decoded source mesh
    after.glb     # SLAT-decoded edited mesh
    compare.png   # 2D before|after reference (ori.png | edit_img.png)
```

`gallery/` holds editing examples from the **h3d_edit** bench. Both
`before.glb` and `after.glb` are **decoded from SLAT** (`ori_latents.npz` /
`edit_latents.npz`) through the *same* TRELLIS `decode_slat` + postprocess
path, so the before/after pair has matching mesh quality. The pair is then
**jointly normalized** — centred and scaled by the *same* transform (fit to a
unit box from their combined bounding box) — so both viewers display at a
consistent size and stay camera-aligned.

The decoder lives in the parent repo:
`scripts/tools/decode_h3d_edit_bench_to_glb.py` (run in the `vinedresser3d`
conda env, needs a GPU + `checkpoints/TRELLIS-text-xlarge`).

## Editing Results section

The gallery is **grouped by edit type**; each type is a row of up to three
cards. Each card has three panels:

- **left** — `before.glb` 3D viewer
- **middle** — the `compare.png` 2D before/after reference, with the edit
  instruction printed below it
- **right** — `after.glb` 3D viewer

Click **Load 3D** to load both meshes; dragging either viewer rotates both
(the Before/After cameras stay in sync).

To add examples: decode them with the tool above into `gallery/<edit_id>/`,
add an entry to `gallery/manifest.json`, and regenerate the Results section.

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
