<?PHP

$host = "i260amod1.radiustoday.com";
$ip = "10.255.156.7";

$resolved_hostname = gethostbyaddr($ip);

$resolved_ip = gethostbyname($host);

echo "The IP address $ip resolves to $resolved_hostname";

echo "The Hostname $host resolves to $resolved_ip";

?>
