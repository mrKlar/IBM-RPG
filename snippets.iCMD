# Snippets of IBMi commands


# Start QShell
QCMD


# Start SQL
STRSQL


# Start Aldon LMI
STRLMI


# Call Compiled Program
CALL BOLIB/HELLOCLLE


# Work with members PDM
WRKMBRPDM BOLIB/QRPGLESRC


# Work with all objects
WRKOBJ OTTEB*


# Work with user jobs
WRKUSRJOB


# Display job log
DSPJOBLOG   # F10 detailed information


# Display user profile
DSPUSRPRF OTTEB


# Display all objects
DSPOBJD OBJ(BOLIB/*ALL) OBJTYPE(*ALL)  # *PGM *FILE


# Display physical file
DSPPFM BOLIB/QCLLESRC


# Compiling an MI program with CLP
DLTOVR QMISRC
OVRDBF QMISRC MBR(MI01)
CALL CLCRTPG MI01


YWRKF BOLIB/QCLLESRC


WRKOBJ OBJ(*ALL/QUSRSYS) OBJTYPE(*LIB)


# Display data area
DSPDTAARA *LDA
# LDA -> default data area


# Change data area
CHGDTAARA


# Call physical file
STRSQL
SELECT * FROM BOLIB/QDDSSRC/MYPF


# Update physical file
UPDDTA BOLIB/QDDSSRC/MYPF


# Change physical file
CHGPF BOLIB/QDDSSRC/MYPF


# Add new member to physical file
ADDPFM BOLIB/QDDSSRC/PF1


# Run query
RUNQRY QRYFILE((BOLIB/QDDSSRC/MYPF))


# Display file description
DSPFD BOLIB/QDDSSRC/MYPF


# Display file field description
DSPFFD BOLIB/QDDSSRC/MYPF
