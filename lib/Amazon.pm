package Amazon;
use strict;
use warnings;
use utf8;
use Data::Dumper;

sub new {
	my ( $class ) = @_;

	my $data = { name => 'Perfect Perl', price => 1000, release => '2010/11', amount => 2 };
	
	warn Dumper $data;

	#die 'ERROR: hoge required' unless defined $options{hoge};
	bless {
		data => $data,
	}, $class;
}

sub get_data {
	my ( $self ) = @_;
	return {
		name => $self->{data}->{name},
		price => $self->{data}->{price},
		release => $self->{data}->{release},
		amount => $self->{data}->{amount},
	} 
}

sub add_cart {
	#my ( $class, %options ) = @_;

	#die 商品の名前が合ってるか
	#die 在庫数があるか
	#bless {
	#	name => $data->{name},
	#	....
	#}, $class;
}

1;

