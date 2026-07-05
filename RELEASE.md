# Release

This addon is configured for CurseForge automatic packaging from Git tags.

## CurseForge Configuration

Enable repository packaging in the CurseForge project and point it at this addon's source repository.

## Publish

Use version tags. The packager uses the tag as `@project-version@`.

```bash
git tag -a 1.0.0 -m "1.0.0"
git push origin 1.0.0
```
