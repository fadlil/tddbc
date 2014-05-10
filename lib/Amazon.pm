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
	
    my $cart = {}; 
	#warn Dumper $data;

	#die 'ERROR: hoge required' unless defined $options{hoge};
	bless {
		data => $data,
        cart => $cart,  
	}, $class;
}

sub get_data {
	my ( $self, $options ) = @_;
	#warn Dumper $self->{data}->{$options};
	return $self->{data}->{$options};
}

sub get_cart{
    my ( $self,  $options ) = @_;
	return $self->{cart}->{$options};
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
      
    $self->{cart}->{$options->{key}} = $self->{data}->{$options->{key}};
    $self->{cart}->{$options->{key}}->{amount} = $options->{amount};
    
    return $self->{data}->{$options->{key}}->{amount};
}

sub buy_cart {
    my ( $self,  $delivery,  $pay ) = @_;
    my $deliveries = { normal => 0,  fast => 200 };
    my $pays = [ 'credit',  'cash',  'atm' ];

    die 'error: wrong delivery' unless $deliveries->{$delivery};
    warn Dumper $delivery;
    warn Dumper $pay;
    return 1;
};
1;

