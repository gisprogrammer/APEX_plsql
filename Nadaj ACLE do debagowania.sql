begin
        dbms_network_acl_admin.append_host_ace
           (host=>'*',
            ace=> sys.xs$ace_type(privilege_list=>sys.XS$NAME_LIST('JDWP') ,
                           principal_name=>'SOP',
                           principal_type=>sys.XS_ACL.PTYPE_DB) );
        end;
    /