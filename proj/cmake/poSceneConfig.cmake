if( NOT TARGET poScene )
	get_filename_component( POSCENE_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	
	list( APPEND POSCENE_SOURCES
		${POSCENE_SOURCE_PATH}/PoScene/DragAndDrop.cpp
		${POSCENE_SOURCE_PATH}/PoScene/DraggableView.cpp
		${POSCENE_SOURCE_PATH}/PoScene/EventCenter.cpp
		${POSCENE_SOURCE_PATH}/PoScene/Events.cpp
		${POSCENE_SOURCE_PATH}/PoScene/ImageView.cpp
		${POSCENE_SOURCE_PATH}/PoScene/MatrixSet.cpp
		${POSCENE_SOURCE_PATH}/PoScene/Scene.cpp
		${POSCENE_SOURCE_PATH}/PoScene/ShapeView.cpp
		${POSCENE_SOURCE_PATH}/PoScene/TextView.cpp
		${POSCENE_SOURCE_PATH}/PoScene/View.cpp
		${POSCENE_SOURCE_PATH}/PoScene/ViewController.cpp
		${POSCENE_SOURCE_PATH}/PoScene/ui/Button.cpp
		${POSCENE_SOURCE_PATH}/PoScene/ui/ButtonSet.cpp
		${POSCENE_SOURCE_PATH}/PoScene/ui/ScrollView.cpp
	)
	add_library( poScene ${POSCENE_SOURCES})


	target_include_directories( poScene PUBLIC "${POSCENE_SOURCE_PATH}" )
	target_include_directories( poScene SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )

	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
	target_link_libraries( poScene PRIVATE cinder )
	
endif()



