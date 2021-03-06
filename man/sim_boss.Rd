% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_boss.R
\name{sim_boss}
\alias{sim_boss}
\title{Simulate Boss Fight}
\usage{
sim_boss(stats, trinkets = NULL, time = 150, seed = NULL)
}
\arguments{
\item{stats}{a named list with the stats of the character including int, sp,
crit, hit and mp5}

\item{trinkets}{which use trinkets are equipped, currently implemented:
toep (Talisman of Ephemeral Power)
zhc (Zandalarian Hero Charm)}

\item{time}{length of fight in seconds}

\item{seed}{optional seed}
}
\value{
a numeric vector with values for total dmg, mana, total casttime and
dps
}
\description{
Simulates one boss fight with default values.
}
\examples{
sim_boss(list(int = 277, sp = 346, crit = 2, hit = 2))
}
