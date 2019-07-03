CREATE OR REPLACE PACKAGE spp_lovs AS
-- Package header for LOVS sar++
-- usage: SELECT * FROM TABLE (SPP_LOVS.GET_JEDNOSTKI());
 /* Jednostki */
    TYPE t_jednostka IS RECORD (d VARCHAR2(4000), r NUMBER);
    TYPE t_jednostki IS TABLE OF t_jednostka;
    FUNCTION get_jednostki RETURN t_jednostki PIPELINED;
 /* */
END spp_lovs;
/


CREATE OR REPLACE PACKAGE BODY spp_lovs AS
-- Package body for LOVS sar++
    FUNCTION get_jednostki RETURN t_jednostki PIPELINED AS
        l_jednostka   t_jednostka;
        l_jednostki   t_jednostki;
        CURSOR l_cur IS
        SELECT j.numerbp   d,
               j.id        r
        FROM sop.jednostki j
        ORDER BY 1;
    BEGIN
        OPEN l_cur;
        LOOP
            FETCH l_cur INTO l_jednostka;
            EXIT WHEN l_cur%notfound;
            PIPE ROW ( l_jednostka );
        END LOOP;
        CLOSE l_cur;
        return;
    END get_jednostki;
END spp_lovs;
/
