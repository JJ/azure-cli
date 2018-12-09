#!/usr/bin/env perl6

use v6;

use JSON::Tiny;
use HTTP::UserAgent;

sub MAIN( $subscription-id, $token-json ) {
    my $token = from-json( $token-json.IO.slurp )<access_token>;
    my $ua = HTTP::UserAgent.new;
    $ua.timeout = 10;
    my $res = $ua.get( "https://management.azure.com/subscriptions/$subscription-id/locations?api-version=2016-06-01",
                       Authorization => "Bearer $token",
                       Content-Type => "application/json");
    if $res.is-success {
        my $body = $res.decoded-content;
        my @locations = (from-json $body)<value><>;
        say "Nombre, alias";
        for @locations -> $l {
            say $l<displayName>, ", ", $l<id>.split("/")[4];
        }
    } else {
        say "Didn't work: $res";
    }
}
