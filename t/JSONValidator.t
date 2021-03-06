#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Deep;
use DDG::Test::Goodie;

zci answer_type => 'jsonvalidator';
zci is_cached   => 1;

# Build a structured answer that should match the response from the
# Perl file.
sub build_structured_answer {
    my @test_params = @_;

    return '',
        structured_answer => {

            id => "json_validator",

            data => {
                title => 'JSON Validator',
                subtitle => 'Enter JSON below, then click the button to check if it\'s valid or not'
            },

            templates => {
                group => 'text',
                item => 0,
                options => {
                    content => 'DDH.jsonvalidator.content'
                }
            }
        };
}

# Use this to build expected results for your tests.
sub build_test { test_zci(build_structured_answer(@_)) }

ddg_goodie_test(
    [qw( DDG::Goodie::JSONValidator )],

    'json validate' => build_test(),
    'json validator' => build_test(),
    'json validation' => build_test(),
    'validate json' => build_test(),
    'validator json' => build_test(),
    'validation json' => build_test(),
    'json verify' => build_test(),
    'verify json' => build_test(),

    'json viewer' => undef,
    'json visualizer' => undef,
    'json viewer' => undef,
);

done_testing;
