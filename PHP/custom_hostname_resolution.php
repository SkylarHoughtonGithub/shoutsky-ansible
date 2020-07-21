<?PHP

$host = "hostname";
$ip = "ip_address";

$resolved_hostname = gethostbyaddr($ip);

$resolved_ip = gethostbyname($host);

echo "The IP address $ip resolves to $resolved_hostname";

echo "The Hostname $host resolves to $resolved_ip";

?>
