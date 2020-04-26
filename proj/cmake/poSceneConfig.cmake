if( NOT TARGET poScene )
	get_filename_component( POSCENE_SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../src" ABSOLUTE )
	get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )

	
	list( APPEND POSCENE_SOURCES
		${POSCENE_SOURCE_PATH}/poScene/DragAndDrop.cpp
		${POSCENE_SOURCE_PATH}/poScene/DraggableView.cpp
		${POSCENE_SOURCE_PATH}/poScene/EventCenter.cpp
		${POSCENE_SOURCE_PATH}/poScene/Events.cpp
		${POSCENE_SOURCE_PATH}/poScene/ImageView.cpp
		${POSCENE_SOURCE_PATH}/poScene/MatrixSet.cpp
		${POSCENE_SOURCE_PATH}/poScene/Scene.cpp
		${POSCENE_SOURCE_PATH}/poScene/ShapeView.cpp
		${POSCENE_SOURCE_PATH}/poScene/TextView.cpp
		${POSCENE_SOURCE_PATH}/poScene/View.cpp
		${POSCENE_SOURCE_PATH}/poScene/ViewController.cpp
		${POSCENE_SOURCE_PATH}/poScene/ui/Button.cpp
		${POSCENE_SOURCE_PATH}/poScene/ui/ButtonSet.cpp
		${POSCENE_SOURCE_PATH}/poScene/ui/ScrollView.cpp
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



