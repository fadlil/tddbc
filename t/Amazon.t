#!usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Exception;
#binmode STDOUT, ":utf8";
use Data::Dumper;


use_ok 'Amazon';

subtest '基本的な確認' => sub {
	my $amazon = Amazon->new();
	isa_ok $amazon, 'Amazon';
	can_ok $amazon, qw( new );
};

subtest 'data確認' => sub {
	my $amazon = Amazon->new();
	warn Dumper $amazon;
	is $amazon->get_data('perfect_perl')->{name}, 'Perfect Perl', 'nameあるよ';
	is $amazon->get_data('perfect_php')->{name}, 'Perfect PHP', 'priceあるよ';
};

subtest 'test add_cart' => sub {
    my $amazon = Amazon->new();
    is $amazon->add_cart({
            key => 'perfect_perl',
            amount  => 1,  
        }),  1,  'ok';
    throws_ok { $amazon->add_cart({ key => 'amazon',  amount => 2 }) } qr/error: wrong name/,  'no product with such name';
    throws_ok { $amazon->add_cart({ key => 'perfect_perl',  amount => 4}) } qr/error: wrong amount/,  'not enough amount in stock';
};

#subtest '例外' => sub {
#	throws_ok { Amazon->new() } qr/ERROR: hoge required/, 'new時にhogeが必要です';
#	#my $amazon = Amazon->new( hoge => 'fuga' );
#};

#subtest 'hoge()' => sub {
#	my $amazon = Amazon->new( hoge => 'fuga' );
#	is $amazon->hoge(), 1, 'trueが返ること';
#};

done_testing;
