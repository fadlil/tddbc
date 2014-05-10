package Amazon;
use strict;
use warnings;
use utf8;
use Data::Dumper;

sub new {
	my ( $class ) = @_;
	
	my $data = {
		perfect_perl => {
			name	=> 'Perfect Perl',
			price	=> 1000,
			release	=> '2010/11',
			amount	=> 2
		},
		perfect_php	 => {
			name	=> 'Perfect PHP',
			price	=> 1500,
			release	=> '2009/04',
			amount	=> 4 
		}
	};
	
	#warn Dumper $data;

	#die 'ERROR: hoge required' unless defined $options{hoge};
	bless {
		data => $data,
	}, $class;
}

sub get_data {
	my ( $self, $options ) = @_;
	#warn Dumper $self->{data}->{$options};
	return $self->{data}->{$options};
}

sub add_cart {
	my ( $self, $options ) = @_;
    warn Dumper $options->{key};
    #warn Dumper $self->{data}->{name};
    #warn $options eq $self->{data}->{name};
	#foreach my $d (keys $self->{data}){
	#	if($d->{name} eq $options->{name}){
	#		break;
	#	};
	#};

	#warn Dumper $d;
    die 'error: wrong name' unless $self->{data}->{$options->{key}};
    die 'error: wrong amount' unless $options->{amount} <= $self->{data}->{$options->{key}}->{amount};
	
    $self->{data}->{$options->{key}}->{amount} -= $options->{amount};
    warn Dumper $self->{data}->{$options->{key}}->{amount};
    return $self->{data}->{$options->{key}}->{amount};
}

1;

