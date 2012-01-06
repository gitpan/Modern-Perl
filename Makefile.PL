
use strict;
use warnings;

use 5.010;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "enable all of the features of Modern Perl with one import",
  "AUTHOR" => "chromatic",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601",
    "Test::More" => "0.98"
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
    "autodie" => "2.10",
    "feature" => 0,
    "mro" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.20120106",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



