{
    wifi24 => {
	ssid => 'luebeck.freifunk.net',
	channel => 1,
	htmode => 'HT40+',
	mesh_ssid => => '02:d1:11:37:fc:38',
	mesh_bssid => => '02:d1:11:37:fc:38',
    },
    wifi5 => {
	ssid => 'luebeck.freifunk.net (5GHz)',
	channel => 44,
	htmode => 'HT40+',
	mesh_ssid => => '02:d1:11:37:fc:38',
	mesh_bssid => => '02:d1:11:37:fc:38',
    },

    next_node => {
	ip4 => '10.130.0.1',
	prefix4 => '10.130.0.0/20',

	ip6 => 'fdef:ffc0:3dd7::1',
	prefix6 => 'fdef:ffc0:3dd7::/64',

	mac => '16:41:95:40:f7:dc',
    },
}
