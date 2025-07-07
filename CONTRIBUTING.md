We welcome feedback and improvements to this project, especially from those engaging with OLSPub or PubMed metadata out of necessity rather than enthusiasm. \<PubNote> is here to make that journey smoother.

# Contributions

[code-of-conduct]: CODE_OF_CONDUCT.md

Contributions to \<PubNote> are welcome, but please remember that proposed additions may or may not be incorporated into the main branch based on a thorough review of their applicability and security.

As you can see, the repository is standalone and self-contained. All of the services provided are executed within the repository, acting on user files that are outside of the repository. At this time it is anticipated that future revisions to the main branch will continue this rule of thumb.

At this time, the scope of \<PubNote> is limited to the simple, relatively flat metadata files submitted to and distributed from OLSPub and PubMed.

At this time, the objective of \<PubNote> is to make the XML markup easy to work with for non-XML'ers.

Please review and comment on the project [roadmap](ROADMAP.md) looking ahead at future phases.

Meanwhile, your input is most welcome. By participating in this project you agree to abide by the terms of the [Contributor Code of Conduct][code-of-conduct].

If you’re not a developer but have suggestions about wording, documentation, or usability, feel free to [open a new issue](https://github.com/realtaonline/PubNote/issues/new) — those contributions are just as valued.

## Issues and PRs

If you have suggestions for how this project could be improved, or want to report a bug, open an issue! We'd love all and any contributions. If you have questions, too, we'd love to hear them.

We'd also love PRs. If you're thinking of a large PR, we advise opening up an issue first to talk about it, though! Look at the links below if you're not sure how to open a PR.

## Submitting a pull request

1. [Fork][fork] and clone the repository.
1. Make sure the environment runs on your machine.
1. Create a new branch: `git checkout -b my-branch-name`.
1. Make your change, add tests, and make sure the original tests still pass.
1. Please do not include a version-*.txt file in your pull request. Versioning and packaging are handled by the repository maintainer upon approval and merge.
1. Push to your fork and [submit a pull request][pr].
1. Pat yourself on the back.
1. We’ll take it from there and be in touch after review.

Here are a few things you can do that will increase the likelihood of your pull request being accepted:

- Write and update tests.
- Keep your changes as focused as possible. If there are multiple changes you would like to make that are not dependent upon each other, consider submitting them as separate pull requests.
- Write a [good commit message](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html).

Work in Progress pull requests are also welcome to get feedback early on, or if there is something blocked you.

## Release workflow

Only the Réalta repository maintainer account can make a release. They determine the next version number to use for the release and update the submitter's branch with the revised `version-*.txt` file. 

The YAML script `release.yml` prepares a release with the artefact needed for non-Mac users.

The `dev/makeMac.sh` script then is run to create the DMG file that is manually added to the release.

## Resources

- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
- [Using Pull Requests](https://help.github.com/articles/about-pull-requests/)
- [GitHub Help](https://help.github.com)

