
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "enable all of the features of Modern Perl with one import",
  "AUTHOR" => "chromatic",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Modern-Perl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Modern::Perl",
  "PREREQ_PM" => {
    "IO::File" => 0,
    "IO::Handle" => 0,
    "autodie" => "2.22",
    "feature" => 0,
    "mro" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => "0.98"
  },
  "VERSION" => "1.20140107",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "IO::File" => 0,
  "IO::Handle" => 0,
  "Module::Build" => "0.3601",
  "Test::More" => "0.98",
  "autodie" => "2.22",
  "feature" => 0,
  "mro" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



