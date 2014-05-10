package Amazon;
use strict;
use warnings;
use utf8;
use Data::Dumper;

sub new {
	my ( $class ) = @_;

	my $data = { name => 'Perfect Perl', price => 1000, release => '2010/11', amount => 2 };
	
    #warn Dumper $data;

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
	my ( $self, $options ) = @_;
    warn Dumper $options->{name};
    #warn Dumper $self->{data}->{name};
    #warn $options eq $self->{data}->{name};
    die 'error: wrong name' unless $options->{name} eq $self->{data}->{name};
    die 'error: wrong amount' unless $options->{amount} <= $self->{data}->{amount};

    $self->{data}->{amount} -= $options->{amount};
    return $self->{dat}->{amount};
}

1;

