<?php

if (!function_exists('getHostFromUrl')) {
    function getHostFromUrl($url) {
        $parsedUrl = parse_url($url);
        return $parsedUrl['host'] ?? 'undefined';
    }
}