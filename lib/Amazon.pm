package Amazon;
use strict;
use warnings;
use utf8;

sub new {
	my ( $class, %options ) = @_;
	die 'ERROR: hoge required' unless defined $options{hoge};
	bless {
		hoge => $options{hoge},
	}, $class;
}

sub hoge {
	my ( $self ) = @_;
	
	1;
}

1;

