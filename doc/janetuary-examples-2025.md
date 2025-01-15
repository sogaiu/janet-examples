# Janetuary 2025 Examples

## Background

See [this Zulip
discussion](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/493004444).

## Suggested Process

### TLDR

The basic idea is to work on one thing per PR to provide examples
for and to try to let others know what that is via the title chosen
for the PR.

### The Detailed Version

1. Fork the [janet-lang.org
   repository](https://github.com/janet-lang/janet-lang.org) and
   verify that `make; make run` works locally.

    Windows note: via WSL2 is the only method that has been reported to
    succeed.

2. Find a single function, macro, variable, etc. to work on.

   This might be done by checking [erichaney's
   checklist](https://gist.github.com/erichaney/83fa66f13ae7682287f573da6c5c66c6),
   [the core API page](https://janet-lang.org/api/index.html), etc.

    Note: It might work out better to avoid choosing something that is
    currently "in-progress".  This is because if someone else is
    already working on the same item modifications may become
    necessary when it is time to merge.  Checking the [existing
    PRs](https://github.com/janet-lang/janet-lang.org/pulls) may be
    helpful toward this end.

3. Make a draft PR to the [janet-lang.org
   repository](https://github.com/janet-lang/janet-lang.org).

   1. The PR should be via a branch on the fork made earlier.

   2. It's nicer if the PR title contains the words:

      * "example" (or "examples")
      * the name of the target function, macro, variable, etc.

      For example, `Add example for ++`.

      This helps when looking through the commit log later, but it may
      also be helpful for folks who want to get a sense of what's
      currently being worked on.

   3. Making a draft PR can act as a signal to others that work is being
      done on a particular identified function, macro, variable, etc.

    Note that:

    * The single target file for an example should go in the
    `examples` subdirectory.

    * Certain filenames may need escaping; [erichaney's
    checklist](https://gist.github.com/erichaney/83fa66f13ae7682287f573da6c5c66c6)
    has precomputed values for many filenames.  See the
    [Escaping in Filenames](#escaping-in-filenames) section below
    for details.

4. Work on examples and verify them locally.

   Verification might include steps such as:

    * Checking the evaluation results

    * Running `make; make run` for the repository root and viewing the
      appropriate web page that should reflect one's work

5. Ask for a review of the draft PR.

6. Incorporate revisions if needed until PR is ready.

## Merged PR Examples

Below are some examples of merged PRs:

* [#249 - `++` by erichaney](https://github.com/janet-lang/janet-lang.org/pull/249)
* [#251 - `string/trim` by
  rwtolbert](https://github.com/janet-lang/janet-lang.org/pull/251)

## Escaping in Filenames

To cope with some of Janet's symbols having names with characters that
are not-so-friendly to certain filesystems and operating systems, an
escaping scheme is used.

Currently, there are seven characters that should not be used as is.
The following table by erichaney enumerates the cases and
replacements:

|Symbol | Replacement|
|-------|------------|
|%      |_37         |
|*      |_42         |
|/      |_47         |
|:      |_58         |
|<      |_60         |
|>      |_62         |
|?      |_63         |

As a concrete example, consider the name `string/has-prefix?`.  Since
that name contains both a `/` and a `?`, two characters need to be
replaced:

* `/` should be replaced with `_47`
* `?` should be replaced with `_63`

Thus, the corresponding filename should be
`string_47has-prefix_63.janet` and live under the `examples`
directory.

The following code might take care of things:

```janet
(def replacer
  (peg/compile
    ~(accumulate
       (any
         (choice (replace (capture (set "%*/:<>?"))
                          ,|(string "_" (get $ 0)))
                 (capture 1))))))

(defn sym-to-filename
  ``
  Convert a symbol to a filename. Certain filenames are not allowed on
  various operating systems.
  ``
  [fname]
  (string "examples/"
          (get (peg/match replacer fname) 0) ".janet"))

(defn main
  [& args]
  (def symbol-name (get args 1))
  (assert symbol-name "please specify a symbol name")
  (print (string/slice (sym-to-filename symbol-name)
                       (length "examples/"))))
```

## Credits

* erichaney
* rwtolbert

