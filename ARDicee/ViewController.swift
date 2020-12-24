//
//  ViewController.swift
//  ARDicee
//
//  Created by Denis Aleksandrov on 12/24/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        /*
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        */
        
        let redColorMaterial = SCNMaterial()
        let moonTextureMaterial = SCNMaterial()
        redColorMaterial.diffuse.contents = UIColor.red
        moonTextureMaterial.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")

        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        cube.materials = [redColorMaterial]

        let sphere = SCNSphere(radius: 0.2)
        sphere.materials = [moonTextureMaterial]

        let cubeNode = SCNNode()
        let sphereNode = SCNNode()
        cubeNode.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        sphereNode.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        cubeNode.geometry = cube
        sphereNode.geometry = sphere
        sceneView.scene.rootNode.addChildNode(sphereNode)
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        print(#function + ": Is ARWorldTrackingConfiguration supported? \(ARWorldTrackingConfiguration.isSupported)")
        print(#function + ": Is ARConfiguration supported? \(ARConfiguration.isSupported)")
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
