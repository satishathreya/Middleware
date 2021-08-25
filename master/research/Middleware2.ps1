
[string]$shell_folder="c:/users/satis/Documents/Job Purposes/Year2021/Western Australia/FutureYou/Work"
[string]$source_folder=$shell_folder+"/ExportTest"

#[string]$source_filename=($source_folder+'/TEST-RIS.xml')
#[string]$source_filename=($source_folder+'/HealthLink E-Referrals.xml')
#dir $source_folder


$query_paths=[System.Collections.ArrayList]@(
            "/channelGroup/channels",
            "/channelGroup/channels/channel/sourceConnector",
            "/channelGroup/channels/channel/destinationConnectors",
            "/channelGroup/channels/channel/destinationConnectors/connector/properties//remoteAddress|//remotePort|//channelId" );

#Read folders
[boolean]$bLoop=$false;


#[System.Xml.XmlNode[]]$xml_lists=(Select-Xml -Path $source_filename -XPath $query_paths[0]).Node;
$xml_lists = [System.Collections.ArrayList]@();

[int]$i=0;
do
{
    [int]$ixml_inst=0;
    $bLoop=$false;

    foreach($master_diver in Get-ChildItem $source_folder){


        for ($i =0; $i -lt $query_paths.Count; $i++) { 
            
            $xml_lists.Add( (Select-Xml -Path $master_diver.FullName -XPath $query_paths[$i]).Node );
            foreach($v in $xml_lists){
                Write-Host $v;
            }
        }

    }#for - master_diver
    
} while ($bLoop -eq $true);
 
$xml_lists.Clear();