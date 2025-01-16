# Janetuary 2025 Examples

## Background

See [this Zulip
discussion](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/493004444).

## Suggested Process

### TLDR

The basic idea is to:

1. Work on one thing per PR to provide examples for

2. Let others know what that thing is via the title chosen for the PR

Note: If you don't feel like reading the detailed version of the
suggested process below, just be aware that there are a couple of
sections beneath it that might be worth a glance:

* [Merged PR Examples](#merged-pr-examples) - to get a concrete sense
  of what various folks have done already.

* [Escaping in Filenames](#escaping-in-filenames) - to be aware that
  there a some cases where the filename to include in the PR might
  need a bit of massaging.

### The Detailed Version

1. Fork the [janet-lang.org
   repository](https://github.com/janet-lang/janet-lang.org) and
   verify that the site can be built and served locally.

   <details>
   <summary>Sample Commands</summary>
   <pre>
   # replace &lt;username&gt; with appropriate username
   git clone https://github.com/&lt;username&gt;/janet-lang.org
   cd janet-lang.org
   make; make run
   # visit http://localhost:8000/api/index.html to verify
   </pre>
   </details>

   <details>
   <summary>Windows note</summary>
   On Windows, via WSL2 is the only method that has been reported to
   succeed.
   </details>

2. Find a single function, macro, variable, etc. to work on.

   <details>
   <summary>Hints for Finding a Target</summary>
   This might be done by checking <a href="https://gist.github.com/erichaney/83fa66f13ae7682287f573da6c5c66c6">erichaney's
   checklist</a>, <a href="https://janet-lang.org/api/index.html">the core API page</a>, etc.
   </details>

    Note: It might work out better to avoid choosing something that is
    currently "in-progress".  Checking the [existing
    PRs](https://github.com/janet-lang/janet-lang.org/pulls) may be
    helpful toward this end.

   <details>
   <summary>Why?</summary>
   This is because if someone else is already working on the same item
   changes may become necessary when it is time to merge.
   </details>

3. Make a draft PR to the [janet-lang.org
   repository](https://github.com/janet-lang/janet-lang.org).

   <details>
   <summary>Why?</summary>
   Making a draft PR can act as a signal to others that work is being
   done on a particular identified function, macro, variable, etc.  This
   allows folks to more easily avoid working on the same item at the
   same time (avoiding duplication of effort) but also reduce potential
   coordination and/or modification that may become needed if changes
   are needed before merging.
   </details>

   1. The PR should be via a branch on the fork made earlier.

   2. It's nicer if the PR title contains the words:

      * "example" (or "examples")
      * the name of the target function, macro, variable, etc.

      For example, `Add example for ++`.

      <details>
      <summary>Why?</summary>
      This helps when looking through the commit log later, but it may
      also be helpful for other folks who want to get a sense of what's
      currently being worked on.
      </details>

   3. The single target file for an example should reside in the
      `examples` subdirectory.

      Note: Certain filenames may need [escaping](#escaping-in-filenames).

4. Work on examples and verify them locally.

   <details>
   <summary>Verfication Hints</summary>
   Possibly useful steps include:

   * Check the evaluation results and/or any prose.

   * Run `make; make run` for the repository root.

   * View the appropriate web page that should reflect one's work.
   </details>

5. Ask for a review of the draft PR.

6. Incorporate revisions if needed until PR is ready.

## Merged PR Examples

Below are some examples of merged PRs:

* [#249 - `++` by erichaney](https://github.com/janet-lang/janet-lang.org/pull/249)
* [#251 - `string/trim` by
  rwtolbert](https://github.com/janet-lang/janet-lang.org/pull/251)

## Escaping in Filenames

### Checklist

[erichaney's checklist](https://gist.github.com/erichaney/83fa66f13ae7682287f573da6c5c66c6) has precomputed values for many filenames.  So if you just
want to find out what to use for a particular symbol's filename, that
might be a convenient place to look.

### Details

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

Supposing that the code above is saved as `convert.janet`, it might
be used like:

```
$ janet convert.janet string/has-prefix?
string_47has-prefix_63.janet
```

## Credits

* erichaney
* rwtolbert

