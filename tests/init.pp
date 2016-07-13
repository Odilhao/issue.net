node default {
  notify { 'before': }
  -> class { 'issue': }
  -> notify { 'last': }
}
