#!usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Exception;
#binmode STDOUT, ":utf8";

use_ok 'Amazon';

subtest '基本的な確認' => sub {
	my $amazon = Amazon->new( hoge => 'fuga' );
	isa_ok $amazon, 'Amazon';
	can_ok $amazon, qw( new );
};

subtest '例外' => sub {
	throws_ok { Amazon->new() } qr/ERROR: hoge required/, 'new時にhogeが必要です';
	#my $amazon = Amazon->new( hoge => 'fuga' );
};

subtest 'hoge()' => sub {
	my $amazon = Amazon->new( hoge => 'fuga' );
	is $amazon->hoge(), 1, 'trueが返ること';
};

done_testing;
