# Git

## Delete local and remote tag

```sh
git tag -d 12345
git push origin :refs/tags/12345
```

## Delete local and remote branch

```sh
git branch -D example
git push origin --delete example
```

## Create zipball

```sh
git archive HEAD | gzip > repo.tar.gz
```

## Delete file from Git, but keep it locally

```sh
git rm --cached -r file
```

## Clean files that would be overwritten by merge

```sh
git clean -dfx
```

## Remove stale branches on remote

```sh
git remote prune origin
```

## Get branch from detached state

```sh
git log -n 1 --pretty=%d HEAD | cut -d, -f2 | xargs | sed 's/)//'
```

## Visualize conflicts

```sh
git format-patch master --stdout | git apply --check -
```

## Reparent a branch

```sh
git checkout -b right-parent
git cherry-pick old-parent..target-branch
```

## Add executable bit to file

```sh
git update-index --chmod=+x file
```

## Convert cvs to git

```sh
rsync -av rsync://repo.cvs.sourceforge.net/cvsroot/repo/ repo
cvs2git --blobfile=b.dat --dumpfile=d.dat --username=$USER repo
git init repo.git
cd repo.git
cat ../d.dat ../b.dat | git fast-import
git gc --prune=now
git checkout master
```
