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
suggested process below, just be aware that there are some sections
beneath it that might be worth a glance:

* [Merged PR Examples](#merged-pr-examples) - to get a concrete sense
  of what various folks have done already.

* [Escaping in Filenames](#escaping-in-filenames) - to be aware that
  there are some cases where the filename to include in the PR might
  need a bit of massaging.

* [Example Content](#example-content) - to get some hints about:
  * What kinds of examples might be helpful
  * What conventions might be good to follow when expressing examples
  * What to do if you discover something that seems amiss or odd

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

   Please consider the [example content section](#example-content) for
   things to keep in mind when constructing examples.

   <details>
   <summary>Verfication Hints</summary>
   Possibly useful steps include:

   * Check the evaluation results and/or any prose.

   * Run `make; make run` for the repository root.

   * View the appropriate web page that should reflect one's work.
   </details>

5. Ask for a review of the draft PR.

   <details>
   <summary>How?</summary>
   Some options include:

   * One can <a href="https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/changing-the-stage-of-a-pull-request#marking-a-pull-request-as-ready-for-review">mark a draft PR as "ready for review"</a>.

   * Let us know via the <a href="https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/493004444">Zulip discussion</a>.
   </details>

6. Incorporate revisions if needed until PR is ready.

## Merged PR Examples

Below are some examples of merged PRs:

* [#249 - `++` by erichaney](https://github.com/janet-lang/janet-lang.org/pull/249)
* [#251 - `string/trim` by
  rwtolbert](https://github.com/janet-lang/janet-lang.org/pull/251)
* [#272 - `*repl-prompt*` by
  mpwillson](https://github.com/janet-lang/janet-lang.org/pull/272)

## Escaping in Filenames

To cope with some of Janet's symbols having names with characters that
are not-so-friendly to certain filesystem and/or operating system
combinations, an escaping scheme is used.

Below are a number of ways to end up with a usable filename.

### Checklist

[erichaney's checklist](https://gist.github.com/erichaney/83fa66f13ae7682287f573da6c5c66c6) has precomputed values for many filenames.  So if you just
want to find out what to use for a particular symbol's filename, that
might be a convenient place to look.

### Helper Script

There is a script in the [janet-lang.org
repository](https://github.com/janet-lang/janet-lang.org) that can
apply the escaping scheme.

For a given symbol, use the `content/api/examples.janet` script to
generate an appropriate filename.  For example, for `array/new`,
invoking:

```
$ janet content/api/examples.janet array/new
```

should give the output:

```
array_47new.janet
```

Note that certain characters entered at one's shell may themselves
need escaping.  For example, in many shells, passing a literal `*` to
the script can be accomplished by preceding it with a backslash
character:

```
$ janet content/api/examples.janet \*
```

A non-comprehensive list of these sorts of characters (at least for
some shells) includes:

* `*`
* `<`
* `>`

### Escaping Scheme

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

## Example Content

Note that, at a bare minimum (as stated near the end of the [Adding
Examples
section](https://github.com/janet-lang/janet-lang.org#adding-examples)
of the janet-lang.org repository `README`):

> Make sure that your example has correct janet syntax, as syntax
> errors will cause the entire site to not build.

Apart from this, please find below:

* hints for helpful examples (e.g. what sorts of examples might be
  good to have)
* conventions (e.g. expressing return and error values)
* coping with oddities (e.g. what to do when behavior and docs
  conflict)

### Hints for Helpful Examples

The following non-exhaustively lists some characteristics that might
be useful for examples to have:

* Shows typical usage
* Demonstrates intended edge cases
* Clarifies potential ambiguities or confusion
* Simple to understand
* Fixes / tweaks a community example from elsewhere

### Conventions

There are a number of emerging conventions for expressing the
examples regarding:

* Return Values
* Errors
* Output

Articulating examples along the following lines may aid in
comprehension and reduce confusion.

#### Return Values

Return values are expressed using `# -> <value>`, e.g.:

```
(% 10 3) # -> 1
```

Typically, the `# -> <value>` construct appears after the code it is
associated with.

#### Errors

Errors are expressed using `# -> <error message>`, e.g.:

```
(empty? 0) # -> error: expected iterable type, got 0
```

Typically a characteristic portion of the actual error message is
used, often a subset of the first line of error output (so leaving off
additional lines if there is a stacktrace).

Note that sometimes the actual error message might start with
something other than `error:` (such as repl prompt info like
`repl:2:1:`), but it might be better to leave those bits out.

However, some error messages might continue with a relevant word
such as `compile`, in which case keeping such words might be good:

```
(module/not-exposed-fn 10) # -> compile error: unknown symbol module/not-exposed-fn
```

#### Output

Output is expressed using a description with one or more line comments
preceding or following the example:

```
(defn simple
  [x]
  (print (+ x 1)))

  # prints 11
  (simple 10) # -> nil
```

or:

```
(loop [x :range [0 100] :when (even? x)]
  (print x)) # -> nil
# prints even numbers 0, 2, 4, ..., 98
```

or:

```
(defn print-pairs
  [x]
  (loop [[k v] :pairs x]
    (printf "[%v]=%v" k v)))

(print-pairs [:a :b :c]) # -> nil
# prints
# [0]=:a
# [1]=:b
# [2]=:c
```

### Coping with Oddities

Sometimes a call or use you try might feel "off" in some way.  If it
fits one of the following, please call this out (e.g. by letting us
know via [this Zulip
discussion](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/493004444)):

* Seems to contradict the docstring
* Seems unspecified by the docstring
* Otherwise appears strange or unintuitive

It's possible there's a bug in the behavior, the docstring, or other
documentation.  If we become aware, this might lead to constructive
change that helps us all.

Note that if a PR contains an example that has one of the above
characteristics, merging may be delayed as the matter is examined.

If there is some edge case or behavior that doesn't get resolved
relatively soon, it may be best to remove these kinds of things out of
in-progress PRs.  If / when they get attended to later corresponding
examples might be made at that time.

## Ideas

* "Request examples for X"
* Script that automates some repetitive bits
  * Invoke script in repository root.
  * Display reminder about synchronizing local repository with latest
  * Was there an argument on the command line specifying a Janet symbol?
    * If there was an argument, it should be a legitimate Janet symbol name
      * Script checks whether `examples` directory already contains
        examples for specified symbol.  Can still continue as editing
        existing file is fair game.  If examples exist already could display
        them.
    * If there is no argument, an appropriate symbol is chosen automatically.
      May be the choice should be something for which there aren't yet any
      examples.
  * If needed, script creates an appropriately named file in `examples`
    directory
  * Reminds user to create an appropriately named branch based on
    master branch and switch to it.
  * Report the name of the file to edit
  * Could also remind about this document as well as suggested remaining
    steps
* Make janet-lang.org usable in an ordinary Windows environment
  * Move away from using a Makefile?
  * Maintain Makefile but provide an alternative for Windows?
* Janet version of [The Weird and Wonderful Characters of ...](https://yobriefca.se/blog/2014/05/19/the-weird-and-wonderful-characters-of-clojure/)?

## Future Reference Log

Encountered problems, gotchas, etc.

  * fnaj77 - [discoverability issue](https://github.com/janet-lang/janet-lang.org/issues/197)
  * reym - [search box issue](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetdocs/near/492848998)
  * cideM - [int/to-number boundaries](https://github.com/janet-lang/janet/pull/1544#issuecomment-2589601564)
  * kcjpop - [fn vs |](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/494076412)
  * rwtolbert - [| reader macro](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/494258173)
  * erichaney - [reduce2 behavior when 2nd arg is empty](https://github.com/janet-lang/janet-lang.org/pull/261#issuecomment-2597397017)
  * rwtolbert - [when and lexical scope](https://github.com/janet-lang/janet-lang.org/pull/264#issuecomment-2599693986)

## Potential Future Items

* eventually trim docstrings of other items that have at least one
  example in the corresponding docstring?
  * `debug/break`
  * `fiber/new`
* discuss deprecation of some things
  * [`drop-while`, `drop-until`](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/495625736)
* add testable versions of examples that existed before 2025 Janetuary
  activities.  see
  [here](https://github.com/janet-lang/janet-lang.org/tree/8774d909d65cca9ecd8d3d92d8baa56eef948f7e/examples)
  for which things.
* potential fixes
  * none ATM
* functions to check whether the return value is also an xs
  * determined
    * distinct - returns an array, can work on tuples, arrays, structs, tables
      but what it is supposed to work on is unspecified
  * todo
    * filter
    * drop-until
    * drop-while

## Credits

Thanks to participants for contributions, discussions, initiation, reviews, etc.

* bakpakin
* brendanhowell
* cideM
* erichaney
* kcjpop
* mpwillson
* pepe
* reym
* rwtolbert

