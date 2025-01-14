# Janetuary 2025 Examples

## Background

See [this Zulip
discussion](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janetuary.20Community.20Project.3A.20Write.20API.20examples/near/493004444).

## Suggested Process

1. Fork the [janet-lang.org
   repository](https://github.com/janet-lang/janet-lang.org) and verify
   that `make; make run` works locally.

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

   The PR should be via a branch on the fork made earlier.

   Making a draft PR can act as a signal to others that work is being
   done on a particular identified function, macro, variable, etc.

    Note that:

    * The single target file for an example should go in the
    `examples` subdirectory.

    * Certain filenames may need escaping; [erichaney's
    checklist](https://gist.github.com/erichaney/83fa66f13ae7682287f573da6c5c66c6)
    has precomputed values for many filenames.

4. Work on examples and verify them locally.

   Verification might include steps such as:

    * Checking the evaluation results

    * Running `make; make run` for the repository root and viewing the
      appropriate web page that should reflect one's work

5. Ask for a review in the draft PR.

6. Incorporate revisions if needed until PR is ready.

## Merged PR Examples

Below are some examples of merged PRs:

* [#243](https://github.com/janet-lang/janet-lang.org/pull/243)
* [#249](https://github.com/janet-lang/janet-lang.org/pull/249)

