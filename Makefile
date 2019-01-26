# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_DISTDIR=dist
CND_BUILDDIR=build


# Object Directory
OBJECTDIR=${CND_BUILDDIR}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/menu.o \
	${OBJECTDIR}/Matriz.o \
	${OBJECTDIR}/main.o


# C Compiler Flags
#DEBUG
#CFLAGS=-Wall -DDEBUG -g3
#Sin Debug
CFLAGS=-Wall -DDEBUG -g3 -fopenmp

# CC Compiler Flags
CCFLAGS=-Wall -DDEBUG -g3 -fopenmp
CXXFLAGS=-Wall -DDEBUG -g3 -fopenmp

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lm -fopenmp

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f Makefile ${CND_DISTDIR}/programa

${CND_DISTDIR}/integral: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}
	$(CXX) -o ${CND_DISTDIR}/programa ${OBJECTFILES} ${LDLIBSOPTIONS} 
	${RM} -fr ${CND_BUILDDIR}
	${RM} -fr core


${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CXX) $(CXXFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/main.o main.cpp
	
	
${OBJECTDIR}/Matriz.o: Matriz.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CXX) $(CXXFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/Matriz.o Matriz.cpp

${OBJECTDIR}/menu.o: menu.cpp
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CXX) $(CXXFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/menu.o menu.cpp
	
	

# Clean Targets
clean: ${CLEAN_SUBPROJECTS}
	${RM} -fr ${CND_BUILDDIR}
	${RM} -fr ${CND_DISTDIR}
	${RM} -fr core

# Subprojects
.clean-subprojects:

