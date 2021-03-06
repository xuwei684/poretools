# ensure that `poretools setup.py install` is run 
# prior to running tests

check()
{
    if diff $1 $2; then
    echo ok
    else
    echo fail
    fi
}

#########################
# Test `fasta`
#########################

echo 'check 2D fasta extraction from /Fail directory'
poretools fasta --type 2D YYYYMMDD_HHMM_SampleID/Fail/ > obs_2D_fail.fa
check obs_2D_fail.fa exp_2D_fail.fa
rm obs_2D_fail.fa

echo 'check fasta extraction from SampleID directory'
poretools fasta YYYYMMDD_HHMM_SampleID/ > obs_total.fa
check obs_total.fa exp_total.fa
rm obs_total.fa

#########################
# Test `fastq`
#########################

echo 'check 2D fastq extraction from /Fail directory'
poretools fastq --type 2D YYYYMMDD_HHMM_SampleID/Fail/ > obs_2D_fail.fq
check obs_2D_fail.fq exp_2D_fail.fq
rm obs_2D_fail.fq

echo 'check fastq extraction from all FAST5'
poretools fastq YYYYMMDD_HHMM_SampleID/ > obs_total.fq
check obs_total.fq exp_total.fq
rm obs_total.fq

#########################
# Test `stats`
#########################

echo 'check stats for all FAST5'
poretools stats YYYYMMDD_HHMM_SampleID/ > obs_all_stats
check obs_all_stats exp_all_stats
rm obs_all_stats

echo 'check stats for /Pass FAST5 only'
poretools stats YYYYMMDD_HHMM_SampleID/Pass/ > obs_pass_stats
check obs_pass_stats exp_pass_stats
rm obs_pass_stats


#########################
# Test `winner`
#########################

echo 'check winner from all FAST5'
poretools winner YYYYMMDD_HHMM_SampleID/ > obs_all_winner
check obs_all_winner exp_all_winner
rm obs_all_winner

echo 'check winner from /Pass FAST5 only'
poretools winner YYYYMMDD_HHMM_SampleID/Pass/ > obs_pass_winner
check obs_pass_winner exp_pass_winner
rm obs_pass_winner

#########################
# Test `nucdist`
#########################

echo 'check nucdist in all FAST5'
poretools nucdist YYYYMMDD_HHMM_SampleID/ > obs_all_nucdist
check obs_all_nucdist exp_all_nucdist
rm obs_all_nucdist

echo 'check nucdist in /Fail FAST5 only'
poretools nucdist YYYYMMDD_HHMM_SampleID/Fail/ > obs_fail_nucdist
check obs_fail_nucdist exp_fail_nucdist
rm obs_fail_nucdist

#########################
# Test `qualdist`
#########################

echo 'check qualdist in all FAST5'
poretools qualdist YYYYMMDD_HHMM_SampleID/ > obs_all_qualdist
check obs_all_qualdist exp_all_qualdist
rm obs_all_qualdist

echo 'check qualdist in /Fail FAST5 only'
poretools qualdist YYYYMMDD_HHMM_SampleID/Fail/ > obs_fail_qualdist
check obs_fail_qualdist exp_fail_qualdist
rm obs_fail_qualdist

