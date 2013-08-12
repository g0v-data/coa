#!/usr/bin/perl

use strict;

open FILE, 'coa_self.csv';
my @data;
my $json_string;
my @items = ('綜合糧食自給率','穀類','米','薯類','糖及蜂蜜','子仁及油籽類','蔬菜','果品','肉','蛋','水產','乳品'); 
while (<FILE>) {
	my @foo = split(',', $_);
	if ($foo[2] > 73) {
		my @temp = map { '"'.$items[$_].'":"'.$foo[$_+6].'"' } (0..11);
		my $temp_str = join ",", @temp;
		push @data, "\"$foo[2]\":{$temp_str}";
	}
}
my $json_str = join ',', @data;
print "{$json_str}";
