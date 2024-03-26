features({
    'autoupdater',
    'config-mode-domain-select',
    'ebtables-filter-multicast',
    'ebtables-filter-ra-dhcp',
    'mesh-batman-adv-15',
    'mesh-vpn-fastd',
    'web-private-wifi',
    'radv-filterd',
    'respondd',
    'status-page',
    'web-advanced',
    'web-wizard',
})

if not device_class('tiny') then
    features({
        'wireless-encryption-wpa3',
    })
end

packages({
    '-gluon-config-mode-geo-location',
    '-gluon-config-mode-contact-info',
    'gluon-ebtables-source-filter',
    'gluon-web-mesh-vpn-fastd',
    'iwinfo',
})

if target('x86') then
    packages({
        'nano',
        'htop',
        'ethtool',
    })
end
