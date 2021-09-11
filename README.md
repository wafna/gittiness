# gittiness

Scenarios for learning git.

## Getting Started

In this directory run `./init.sh`.
This will create the repository directory `repo`, 
from which all further commands will be run, 
so cd to that directory.

`clean.sh` will wipe out the repo and start a new one with some local git config settings.

`git hist` is an alias for git log.

The initial branch is main.


## Scenarios

### Reset

Run the following:
```bash
../main.sh
../show.sh
```

You'll see something like this:

```
>>= log
* c977621 0 seconds ago main-4
* c7e8d2a 0 seconds ago main-3
* 93930d4 0 seconds ago main-2
* 0dbdd5e 0 seconds ago main-1
>>= status
On branch main
nothing to commit, working tree clean
>>= ls
main-1	main-2	main-3	main-4
```

Each file is named after the commit that introduced it, making them easy to keep track of.

Run the following:
```bash
../main.sh
git reset HEAD^
../show.sh
```

You'll see something like this:

```
>>= log
* 15dfd82 58 seconds ago main-3
* 5921d43 58 seconds ago main-2
* 9de53c0 58 seconds ago main-1
>>= status
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	main-4

nothing added to commit but untracked files present (use "git add" to track)
>>= ls
main-1	main-2	main-3	main-4
```

The previous HEAD has been returned to the working directory.

### git reset --soft

Run the following:
```bash
../main.sh
git reset --soft HEAD^
../show.sh
```
You'll see something like this:

```
>>= log
* 7cfd732 0 seconds ago main-3
* 57d44ff 0 seconds ago main-2
* 4aea007 0 seconds ago main-1
>>= status
On branch main
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	new file:   main-4

>>= ls
main-1	main-2	main-3	main-4
```

This time, the commit reverted to staging.

### git reset --hard

Run the following:
```bash
../main.sh
git reset --hard HEAD^
../show.sh
```
You'll see something like this:

```
>>= log
* c07df80 0 seconds ago main-3
* 1280752 0 seconds ago main-2
* abcc412 0 seconds ago main-1
>>= status
On branch main
nothing to commit, working tree clean
>>= ls
main-1	main-2	main-3
```
That last commit is gone, daddy, gone!

### Summary

* `git reset` rolls back the HEAD pointer to a previous commit.
* By default, the rolled back commits return to the working tree, either untracked or modified.
* `--soft` dumps the commits in staging.
* `--hard` discards them completely.

<em>*Hard resets are non-recoverable!*</em>


## Branches

Run the following:
```bash
../branch-1.sh
../show-all.sh
```
You'll see something like this:

```
>>= branch-1
* d0d07e9 branch-1-2
* 135f320 branch-1-1
* 7a543b6 main-2
* 3c60e4d main-1
>>= main
* a5ab28c main-6-1
* dd088f7 main-5-1
* e130f3b main-4
* f0da3c7 main-3
* 7a543b6 main-2
* 3c60e4d main-1
```

branch-1 diverges from main after the second commit.

### Merge

Run the following:
```bash
../branch-1.sh
git merge branch-1 --no-edit
../show-all.sh
```
You'll see something like this:

```
>>= branch-1
* 0087ce1 branch-1-2
* 2fe98d4 branch-1-1
* 2ed8f5e main-2
* 5c03b5f main-1
>>= main
*   ee1bc1d Merge branch 'branch-1'
|\  
| * 0087ce1 branch-1-2
| * 2fe98d4 branch-1-1
* | cc786be main-4
* | eeacd63 main-3
|/  
* 2ed8f5e main-2
* 5c03b5f main-1
```

The commits from branch-1 are placed after the commits to main made after the branch.

### Rebase

Run the following:
```bash
../branch-1.sh
git rebase branch-1
../show-all.sh
```
You'll see something like this:

```
>>= branch-1
* 9e93eb3 branch-1-2
* cd285bf branch-1-1
* 37b76a9 main-2
* 8e11d37 main-1
>>= main
* 19c2bf0 main-4
* 7fbce5a main-3
* 9e93eb3 branch-1-2
* cd285bf branch-1-1
* 37b76a9 main-2
* 8e11d37 main-1
```

Now, the history is flat and the commits from the branch are head of the subsequent commits to main.

### Cherry Pick

Run the following:
```bash
../branch-1.sh
git cherry-pick ..branch-1
../show-all.sh
```
You'll see something like this:

```
>>= branch-1
* a3e23c2 branch-1-2
* 18b28b3 branch-1-1
* b8362e4 main-2
* 7a948bb main-1
>>= main
* 9141cf9 branch-1-2
* 568ac0e branch-1-1
* 3baf51c main-4
* 0907356 main-3
* b8362e4 main-2
* 7a948bb main-1
```

Again, the history is flat but, this time, the commits from the branch succeed the commits on main.

