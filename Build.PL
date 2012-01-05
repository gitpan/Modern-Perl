
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::More" => "0.98"
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
  "dist_version" => "1.20120105",
  "license" => "perl",
  "module_name" => "Modern::Perl",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "autodie" => 0,
    "feature" => 0,
    "mro" => 0,
    "perl" => "5.010",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
