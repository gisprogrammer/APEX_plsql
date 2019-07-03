BEGIN
  BEGIN
    dbms_network_acl_admin.drop_acl( acl => 'all-network-PUBLIC.xml' );
  EXCEPTION
  WHEN OTHERS THEN
    NULL;
  END;
  dbms_network_acl_admin.create_acl( acl => 'all-network-PUBLIC.xml',
  description => 'Network connects for all', principal => 'PUBLIC', is_grant =>
  true, privilege => 'connect' );
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE( acl => 'all-network-PUBLIC.xml',
  principal => 'PUBLIC', is_grant => true, privilege => 'resolve' );
  dbms_network_acl_admin.assign_acl( acl => 'all-network-PUBLIC.xml',
  host => '*' );
END;
/