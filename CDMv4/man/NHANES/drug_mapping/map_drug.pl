# The code below attempts to map Preimer drug descriptions to RxNorm codes
# Required input:
# - file "premierrx.txt" in the current folder contains the Premier codes that represent drugs
# - file "rxnorm.txt" in the current folder should contain dump of the RxNorm table
# - file "common_drug.txt" in the current folder should contain list of common words that would be ignored for mapping purposes
# - file "abbrevmap_drug.txt" in the current folder should contain list of expansions to common abbreviation (order dependent)
# Produced output:
# - file "match_drug.txt" will include list of matched entries with the matching score from 0 to 1000, higher score means better match
# - file "nomatch_drug.txt" will include drug descriptions that were not matched with any of the RxNorm entries


#$s = "ACEBUTOLOL HYDROCHLORIDE 400 MG ORAL CAPSULE";
#$s =~ s/(\d+)\s+MG/$1MG/g;
#print "$s\n";
#exit;

&loadCommon();
&loadRxNorm();
&loadAbbrevMap();

open(A, ">match_drug.txt");
print A "NHCODE\NHingredient\trxnorm_desc\tcode\tscore\tsimilar\n";

open(B, ">nomatch_drug.txt");
print B "NHingredient\n";

open(F, "drug_input.txt");
$_ = <F>;
@a = split(/\t/);
for ($i0 = 0; $i0 <= $#a; $i0++)
{
   last if (@a[$i0] eq "std_chg_code");
}
for ($i1 = 0; $i1 <= $#a; $i1++)
{
   last if (@a[$i1] eq "prod_name_desc");
}
for ($i2 = 0; $i2 <= $#a; $i2++)
{
   last if (@a[$i2] eq "std_chg_desc");
}

while (<F>)
{
	@a = split(/\t/);
	$chrgCode = $a[$i0];
	$prodDesc = $a[$i1];
	$chrgDesc = $a[$i2];
	print "\n?? $chrgDesc ";
	
	$maxv = 0;
	$desc = &normPremier($chrgDesc);
	#print "\n=? $desc";
	@list = &lookupRx($desc);
	print "($#list matches)\n";
	for ($i = 0; $i <= $#list; $i++)
	{
		$j = $list[$i];
		print "\n$j $rxList[$j]";
		$v = &score($desc, $rxList[$j]);
		print ".. $rxList[$j] (score=$v)\n";
		if ($v > $maxv)
		{
			$rx = $rxList[$j];
			$maxv = $v;
			$cnt = 1;
		}
		elsif ($v == $maxv)
		{
			++$cnt;
		}
	}
	
	if ($maxv > 0)
	{
		$t = $rx;
		$t =~ s/#ML/\/ML/g;
		$t =~ s/#MG/\/MG/g;
		print "-> $t (score=$maxv)\n";
		print A "$chrgCode\t$chrgDesc\t$t\t$rxCode{$rx}\t$maxv\t$cnt\n";
	}
	else
	{
		print B "$chrgDesc\n";
	}
}
close(A);
close(B);
exit;

sub lookupRx {
	local($a) = @_;
	local($n, $i, $s, $t, $x, @w, @list, %hash) = ();
	@w = split(/\s+/, $a);
	for ($i = 0; $i <= $#w; $i++)
	{
		$x = $w[$i];
		next if (length($x) < 2);
		next if ($common{$x});
		next if ($x =~ /^\D\D$/);
		next if ($x =~ /^[\d\.]+$/);
		next if ($x =~ /^[\d\.]+MG/);
		next if ($x =~ /^[\d\.]+ML/);
		next if ($x =~ /^[\d\.]+GM/);
		next if ($x =~ /^[\d\.]+\%/);
		next if ($x =~ /\#MG$/);
		next if ($x =~ /\#ML$/);
		next if ($x =~ /\#GM$/);

		for ($j = 0; $j <= $#terms; $j++)
		{
			$t = $terms[$j];
			if ($t eq $x)
			{
				$s .= $dictionary{$t};
				#print STDERR "\n$x -> $t : $dictionary{$t}";
			}
		}
	}
	#print STDERR "\n$s";
	@w = split(/,/, $s);
	for ($i = 0; $i <= $#w; $i++)
	{
		$x = $w[$i];
		next if ($hash{$x});
		$list[$n++] = $x*1;
		$hash{$x} = 1;
	}
	return @list;
}

sub score 
{
 local($a, $b) = @_;
 local($i, $j, $n, $t, $x, $y, @aTerms, @bTerms, $maxLen) = ();
 #print "\n$a <-> $b\n";
 $n = 0;
 @aTerms = split(/\s+/, $a);

 $b =~ s/[,\+\/\(\)\[\]\@]/ /g;
 @bTerms = split(/\s+/, $b); 

 $maxLen = max(length($a),length($b));
 for ($i = 0; $i <= $#aTerms; $i++)
 {
    $x = $aTerms[$i];
    for ($j = 0; $j <= $#bTerms; $j++)
		{
			$y = $bTerms[$j];
			if ($y eq $x) 
			{ 
				$n += length($y); 
				last;
			}
		}
 }
 return sprintf("%3.0f",(1.0 * $n)/(1.0 * $maxLen) * 1000);
}



sub normPremier {
	local($a) = @_;
	foreach $t (keys(%abbrevMap))
	{
		$a =~ s/$t/$abbrevMap{$t}/g;
	}
	$a =~ s/\/ML/#ML/g;
	$a =~ s/\/MG/#MG/g;
	$a =~ s/[,\+\/\(\)\[\]\@]/ /g;
	return $a;
}

sub loadRxNorm {
	local(@a,$t,$n,$i) = ();
	print "Loading RxNorm...\n";
	open(F, "rx_norm.txt");
	$_ = <F>;
	@a = split(/\t/);
	for ($i_str = 0; $i_str <= $#a; $i_str++)
	{
	   last if (@a[$i_str] eq "CONCEPT_NAME");
	}
	for ($i_cod = 0; $i_cod <= $#a; $i_cod++)
	{
	   last if (@a[$i_cod] eq "CONCEPT_ID");
	}
	while (<F>)
	{
		chop;
		@a = split(/\t/);
		$t = $a[$i_str];
		$t =~ tr/a-z/A-Z/;
		$t =~ s/(\d+)\s+MG/$1MG/g;
		$t =~ s/(\d+)\s+ML/$1ML/g;
		$t =~ s/(\d+)\s+GM/$1GM/g;
		$t =~ s/\/ML/#ML/g;
		$t =~ s/\/MG/#MG/g;
		if ($rxCode{$t}) 
		{ 
			$dup++;
			if ($rxCode{$t} ne $a[$i_cod]) 
			{
				#print "$rxCode{$t} $a[$i_cod] $t\n"; 
			}
		}
		else
		{
			$rxList[$n] = $t; # name
			$rxCode{$t} = $a[$i_cod]; # name -> code
			$t =~ s/[,\+\/\(\)\[\]\@]/ /g;
			@a = split(/\s/, $t);
			foreach $t (@a)
			{
				next if (length($t) < 2);
				next if ($common{$t});
				next if ($t =~ /^\D\D$/);
				next if ($t =~ /^[\d\.]+$/);
				next if ($t =~ /^[\d\.]+MG/);
				next if ($t =~ /^[\d\.]+ML/);
				next if ($t =~ /^[\d\.]+GM/);
				next if ($t =~ /^[\d\.]+\%/);
				next if ($t =~ /\#MG$/);
				next if ($t =~ /\#ML$/);
				next if ($t =~ /\#GM$/);
				#if ($dict{$t})
				{
					$dictionary{$t} .= "$n,";
					$counter{$t} += 1;
				}
				#else
				#{
				#	$dictionary{$t} = "$n,";
				#	$counter{$t} = 1;
				#}
			}
			++$n;
		}
	}
	close(F);
	print "$n ($dup duplicates)\n";

	$i = 0;
	foreach $t (sort sortByCounter keys(%counter))
	{
		$terms[$i++] = $t;
		#print "$i $t ($counter{$t})\n";
	}

	return $n;
}

sub loadCommon {
	local(@a,$t,$n) = ();
	open(F, "common_drug.txt");
	#$_ = <F>;
	while (<F>)
	{
		chop;
		$common{$_} = 1; 
	}
	close(F);
}

sub loadAbbrevMap {
	local(@a,$t,$n) = ();
	open(F, "abbrevmap_drug2.txt");
	#$_ = <F>;
	while (<F>)
	{
		chop;
		@a = split(/=/);
		#print "$a[0] $a[1]\n";
		$abbrevMap{$a[0]} = $a[1]; 
	}
	close(F);
}

sub sortByCounter 
{
	$counter{$b} <=> $counter{$a};
}

sub max
{
	local ($p1, $p2) = @_;
	if ($p1 > $p2)
	{
	  return $p1;
  }
  else
	{
	  return $p2;
  }
}
