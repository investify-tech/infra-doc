# infra-doc

Hugo-based technical documentation site with draw.io diagram support.

## Prerequisites

- Hugo
- draw.io CLI

## Usage

**Build site:**
```bash
./hugo-build.sh
```

**Start development server (incl. build):**
```bash
./hugo-server.sh
```

The build script automatically converts `.drawio` files in `doc-site/static/images/` to SVG before building.

**Note:** Auto-reload during `hugo server` doesn't trigger diagram conversion. Restart the server after modifying 
`.drawio` files.

## Notes 

### Auto-conversion of drawio files
Hugo doesn't have an extension point to trigger external scripts. There's no way to hook into Hugo's build process to
run external commands before each rebuild.
So, using hugo-preproc or any other tool/script must be managed manually.

## Updates

* **Theme**: Update the theme [Techdoc](https://themes.gohugo.io/themes/hugo-theme-techdoc) by getting the latest
  changes from the git repo. This can be done via this script:
  ```bash
  rm -rf doc-site/themes/hugo-theme-techdoc
  git clone https://github.com/thingsym/hugo-theme-techdoc.git doc-site/themes/hugo-theme-techdoc
  rm -rf doc-site/themes/hugo-theme-techdoc/.git
  ```

* **Hugo**: Hugo itself does not need upgrades in this project. Updating the Hugo installation will update the project 
during the next build.
