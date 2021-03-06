
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "enable all of the features of Modern Perl with one import",
  "dist_author" => [
    "chromatic"
  ],
  "dist_name" => "Modern-Perl",
  "dist_version" => "1.20140107",
  "license" => "perl",
  "module_name" => "Modern::Perl",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "IO::File" => 0,
    "IO::Handle" => 0,
    "autodie" => "2.22",
    "feature" => 0,
    "mro" => 0,
    "perl" => "5.010",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Test::More" => "0.98"
  }
);


my %fallback_build_requires = (
  "Module::Build" => "0.3601",
  "Test::More" => "0.98"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
