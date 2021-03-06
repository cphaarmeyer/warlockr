% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lifetap.R
\name{lifetap}
\alias{lifetap}
\title{Life Tap}
\usage{
lifetap(sp, talents = warlock_talents(), improved_sb_proc = 0)
}
\arguments{
\item{sp}{(shadow) spellpower of character}

\item{talents}{list of talents}

\item{improved_sb_proc}{number of active procs of improved shadow bolt on
target}
}
\value{
a numeric vector with values for dmg, mana, casttime and
improved_sb_proc
}
\description{
Simulates a life tap.
}
\examples{
lifetap(346)
}
